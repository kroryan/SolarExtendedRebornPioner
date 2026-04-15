#!/usr/bin/env python3
"""Convert the legacy 00_sol_EXTENDED.lua system definition to Pioneer JSON.

This is intentionally scoped to Pioneer's old declarative CustomSystem /
CustomSystemBody syntax used by the bundled Sol extension mod.
"""

from __future__ import annotations

import ast
import hashlib
import json
import math
import re
import shutil
from dataclasses import dataclass, field
from pathlib import Path
from typing import Any


SCRIPT_DIR = Path(__file__).resolve().parent
ROOT = SCRIPT_DIR.parent
LUA_PATH = SCRIPT_DIR / "00_sol.lua" if (SCRIPT_DIR / "00_sol.lua").exists() else ROOT / "00_sol_EXTENDED.lua"
OUT_PATH = SCRIPT_DIR / "00_sol.json" if (SCRIPT_DIR / "00_sol.lua").exists() else ROOT / "pioneer" / "data" / "systems" / "custom" / "00_sol.json"
BACKUP_PATH = OUT_PATH.with_name("00_sol_vanilla_2026_backup.json.disabled")


BODY_RE = re.compile(
    r"(?:local\s+(?P<var>[A-Za-z_][A-Za-z0-9_]*)\s*=\s*)?"
    r"CustomSystemBody:new\('(?P<name>(?:\\'|[^'])*)',\s*'(?P<type>[^']+)'\)"
)
METHOD_RE = re.compile(r"^\s*:([A-Za-z_][A-Za-z0-9_]*)\((.*)\)\s*,?\s*$")
LOCAL_TABLE_RE = re.compile(r"^\s*local\s+([A-Za-z_][A-Za-z0-9_]*)\s*=\s*\{\s*$")
IDENT_RE = re.compile(r"^\s*([A-Za-z_][A-Za-z0-9_]*)\s*,?\s*$")


FIELD_MAP = {
    "radius": "radius",
    "mass": "mass",
    "semi_major_axis": "semiMajorAxis",
    "eccentricity": "eccentricity",
    "rotation_period": "rotationPeriod",
    "axial_tilt": "axialTilt",
    "metallicity": "metallicity",
    "volcanicity": "volcanicity",
    "atmos_density": "atmosDensity",
    "atmos_oxidizing": "atmosOxidizing",
    "ocean_cover": "volatileLiquid",
    "ice_cover": "volatileIces",
    "life": "life",
    "orbital_offset": "orbitalOffset",
    "orbital_phase_at_start": "orbitalPhase",
    "rotational_phase_at_start": "rotationPhase",
    "inclination": "inclination",
    "latitude": "inclination",
    "longitude": "orbitalOffset",
}

STARPORT_PARENT_FIXES = {
    "Kaha'ula City": "Hi'aka",
    "Laumiha Colony": "Namaka",
    "Xiangliu Base": "Xiangliu",
    "Weywot Base": "Weywot",
    "New Chiusi": "Vanth",
    "Nereid Outlook": "Actaea",
}


@dataclass(eq=False)
class Body:
    name: str
    type: str
    line: int
    fields: dict[str, Any] = field(default_factory=dict)
    children: list["Body"] = field(default_factory=list)


@dataclass
class TableNode:
    entries: list[Any]


def strip_comment(line: str) -> str:
    in_single = False
    in_double = False
    escaped = False
    for idx, char in enumerate(line):
        if escaped:
            escaped = False
            continue
        if char == "\\":
            escaped = True
            continue
        if char == "'" and not in_double:
            in_single = not in_single
            continue
        if char == '"' and not in_single:
            in_double = not in_double
            continue
        if char == "-" and not in_single and not in_double and line[idx : idx + 2] == "--":
            return line[:idx]
    return line


def split_args(text: str) -> list[str]:
    args: list[str] = []
    depth = 0
    quote: str | None = None
    escaped = False
    start = 0
    for idx, char in enumerate(text):
        if escaped:
            escaped = False
            continue
        if char == "\\":
            escaped = True
            continue
        if quote:
            if char == quote:
                quote = None
            continue
        if char in ("'", '"'):
            quote = char
            continue
        if char in "({[":
            depth += 1
            continue
        if char in ")}]":
            depth -= 1
            continue
        if char == "," and depth == 0:
            args.append(text[start:idx].strip())
            start = idx + 1
    tail = text[start:].strip()
    if tail:
        args.append(tail)
    return args


def safe_number(expr: str) -> float:
    expr = expr.strip().replace("^", "**")
    expr = re.sub(r"(?<![\w.])0+(\d+)(?![\w.])", r"\1", expr)
    tree = ast.parse(expr, mode="eval")
    allowed_nodes = (
        ast.Expression,
        ast.Constant,
        ast.UnaryOp,
        ast.BinOp,
        ast.Add,
        ast.Sub,
        ast.Mult,
        ast.Div,
        ast.Pow,
        ast.USub,
        ast.UAdd,
        ast.Mod,
    )
    for node in ast.walk(tree):
        if not isinstance(node, allowed_nodes):
            raise ValueError(f"unsupported numeric expression: {expr}")
    return float(eval(compile(tree, "<expr>", "eval"), {"__builtins__": {}}, {}))


def eval_value(expr: str) -> Any:
    expr = expr.strip()
    if expr in ("true", "false"):
        return expr == "true"
    if (expr.startswith("'") and expr.endswith("'")) or (expr.startswith('"') and expr.endswith('"')):
        return ast.literal_eval(expr)
    if expr.startswith("f(") and expr.endswith(")"):
        a, b = split_args(expr[2:-1])
        return safe_number(a) / safe_number(b)
    if expr.startswith("math.deg2rad(") and expr.endswith(")"):
        return math.radians(eval_value(expr[len("math.deg2rad(") : -1]))
    if expr.startswith("fixed.deg2rad(") and expr.endswith(")"):
        return math.radians(eval_value(expr[len("fixed.deg2rad(") : -1]))
    if expr.startswith("{") and expr.endswith("}"):
        return [eval_value(arg) for arg in split_args(expr[1:-1])]
    return safe_number(expr)


def deterministic_angle(*parts: str) -> float:
    digest = hashlib.blake2s("|".join(parts).encode("utf-8"), digest_size=8).digest()
    raw = int.from_bytes(digest, "little") / float(1 << 64)
    return raw * math.tau


def default_body(name: str, body_type: str, line: int) -> Body:
    return Body(
        name=name.replace("\\'", "'"),
        type=body_type,
        line=line,
        fields={
            "seed": 0,
            "name": name.replace("\\'", "'"),
            "type": body_type,
            "radius": 0,
            "aspectRatio": 1,
            "mass": 0,
            "rotationPeriod": 0,
            "rotationPhase": 0,
            "humanActivity": 0,
            "semiMajorAxis": 0,
            "eccentricity": 0,
            "orbitalOffset": deterministic_angle(name, "offset"),
            "orbitalPhase": deterministic_angle(name, "phase"),
            "axialTilt": 0,
            "inclination": 0,
            "argOfPeriapsis": deterministic_angle(name, "periapsis"),
            "averageTemp": 0,
            "metallicity": 0,
            "volcanicity": 0,
            "volatileLiquid": 0,
            "volatileIces": 0,
            "atmosDensity": 0,
            "atmosOxidizing": 0,
            "atmosColor": [0, 0, 0, 0],
            "life": 0,
            "population": 0,
            "agricultural": 0,
            "hasRings": False,
        },
    )


def parse_body(lines: list[str], start: int) -> tuple[Body, int]:
    match = BODY_RE.search(lines[start])
    if not match:
        raise ValueError(f"expected body at line {start + 1}")
    body = default_body(match.group("name"), match.group("type"), start + 1)
    idx = start + 1
    while idx < len(lines):
        line = strip_comment(lines[idx]).rstrip()
        if not line.strip():
            idx += 1
            continue
        if not line.lstrip().startswith(":"):
            break
        method_match = METHOD_RE.match(line)
        if not method_match:
            raise ValueError(f"cannot parse method at line {idx + 1}: {line}")
        method, arg_text = method_match.groups()
        args = split_args(arg_text)
        if method == "seed":
            body.fields["seed"] = int(eval_value(args[0])) & 0xFFFFFFFF
        elif method == "temp":
            body.fields["averageTemp"] = int(eval_value(args[0]))
        elif method == "height_map":
            body.fields["heightMapFilename"] = "heightmaps/" + eval_value(args[0])
            body.fields["heightMapFractal"] = int(eval_value(args[1]))
        elif method == "space_station_type":
            body.fields["spaceStationType"] = eval_value(args[0])
        elif method == "rings":
            if len(args) == 1 and eval_value(args[0]) is False:
                body.fields["hasRings"] = False
            elif len(args) >= 3:
                color = eval_value(args[2])
                body.fields["hasRings"] = True
                body.fields["ringsMinRadius"] = eval_value(args[0])
                body.fields["ringsMaxRadius"] = eval_value(args[1])
                body.fields["ringsBaseColor"] = [max(0, min(255, int(c * 255))) for c in color]
        elif method in FIELD_MAP:
            body.fields[FIELD_MAP[method]] = eval_value(args[0])
        else:
            raise ValueError(f"unsupported method {method} at line {idx + 1}")
        idx += 1
    return body, idx


def find_matching_brace(lines: list[str], start: int) -> int:
    depth = 0
    for idx in range(start, len(lines)):
        line = strip_comment(lines[idx])
        depth += line.count("{")
        depth -= line.count("}")
        if depth == 0:
            return idx
    raise ValueError(f"unterminated table starting at line {start + 1}")


def parse_entries(lines: list[str], start: int, end: int, body_by_line: dict[int, Body]) -> list[Any]:
    entries: list[Any] = []
    idx = start
    while idx <= end:
        line = strip_comment(lines[idx]).strip()
        if not line or line in ("}", "},"):
            idx += 1
            continue
        if "CustomSystemBody:new" in line:
            entries.append(body_by_line[idx + 1])
            parsed_body, next_idx = parse_body(lines, idx)
            idx = next_idx
            continue
        if line.startswith("{"):
            nested_end = find_matching_brace(lines, idx)
            entries.append(TableNode(parse_entries(lines, idx + 1, nested_end - 1, body_by_line)))
            idx = nested_end + 1
            continue
        ident = IDENT_RE.match(line)
        if ident:
            entries.append(ident.group(1))
            idx += 1
            continue
        idx += 1
    return entries


def flatten_ref(entry: Any, variables: dict[str, Any]) -> Any:
    if isinstance(entry, str):
        return variables[entry]
    return entry


def add_children(parent: Body, table: TableNode, variables: dict[str, Any], ordered: list[Body]) -> None:
    idx = 0
    entries = table.entries
    while idx < len(entries):
        entry = flatten_ref(entries[idx], variables)
        if isinstance(entry, TableNode):
            raise ValueError(f"table cannot appear where body is expected under {parent.name}")
        child = entry
        if not isinstance(child, Body):
            raise ValueError(f"unknown child entry under {parent.name}: {entry!r}")
        parent.children.append(child)
        ordered.append(child)
        idx += 1
        while idx < len(entries):
            next_entry = flatten_ref(entries[idx], variables)
            if not isinstance(next_entry, TableNode):
                break
            add_children(child, next_entry, variables, ordered)
            idx += 1


def move_child(body: Body, new_parent: Body, ordered: list[Body]) -> None:
    for possible_parent in ordered:
        if body in possible_parent.children:
            possible_parent.children.remove(body)
    if body not in new_parent.children:
        new_parent.children.append(body)


def repair_legacy_hierarchy(ordered: list[Body]) -> None:
    by_name = {body.name: body for body in ordered}
    for child_name, parent_name in STARPORT_PARENT_FIXES.items():
        child = by_name.get(child_name)
        parent = by_name.get(parent_name)
        if child and parent:
            move_child(child, parent, ordered)


def make_json(root: Body, ordered: list[Body]) -> dict[str, Any]:
    index = {body: idx for idx, body in enumerate(ordered)}
    body_nodes = []
    for body in ordered:
        node = dict(body.fields)
        if body.children:
            node["children"] = [index[child] for child in body.children]
        if body is not root:
            for possible_parent in ordered:
                if body in possible_parent.children:
                    node["parent"] = index[possible_parent]
                    break
        body_nodes.append(node)
    return {
        "name": "Sol",
        "stars": ["STAR_G"],
        "sector": [0, 0, 0],
        "pos": [0.008, 0.008, 0.008],
        "seed": 0,
        "explored": True,
        "faction": "Solar Federation",
        "govType": "EARTHDEMOC",
        "lawlessness": 0.01,
        "shortDesc": "The historical birthplace of humankind",
        "longDesc": (
            "Sol is a G-type main-sequence star and the centre of humanity's home system. "
            "At the turn of the 31st century, Sol remains the most densely populated system "
            "in human space, with billions of inhabitants spread across Earth, the terraformed "
            "Mars, orbital habitats, and colonies throughout the belt and outer planets. The "
            "inner system is a bustling crossroads of trade and politics, while the outer reaches "
            "from the gas giants to the distant scattered disc host frontier settlements, research "
            "outposts, and the quiet hum of deep-space industry."
        ),
        "comment": "Converted from 00_sol_EXTENDED.lua for the JSON System Editor era.",
        "bodies": body_nodes,
    }


def main() -> None:
    lines = LUA_PATH.read_text(encoding="utf-8").splitlines()

    body_by_var: dict[str, Body] = {}
    body_by_line: dict[int, Body] = {}
    idx = 0
    while idx < len(lines):
        if "CustomSystemBody:new" in lines[idx]:
            body, next_idx = parse_body(lines, idx)
            body_by_line[body.line] = body
            match = BODY_RE.search(lines[idx])
            if match and match.group("var"):
                body_by_var[match.group("var")] = body
            idx = next_idx
        else:
            idx += 1

    variables: dict[str, Any] = dict(body_by_var)
    idx = 0
    while idx < len(lines):
        table_match = LOCAL_TABLE_RE.match(lines[idx])
        if not table_match:
            idx += 1
            continue
        name = table_match.group(1)
        end = find_matching_brace(lines, idx)
        variables[name] = TableNode(parse_entries(lines, idx + 1, end - 1, body_by_line))
        idx = end + 1

    bodies_start = next(i for i, line in enumerate(lines) if line.strip().startswith("s:bodies(sol,"))
    main_end = find_matching_brace(lines, bodies_start)
    root = variables["sol"]
    ordered = [root]
    add_children(root, TableNode(parse_entries(lines, bodies_start + 1, main_end - 1, body_by_line)), variables, ordered)
    repair_legacy_hierarchy(ordered)

    data = make_json(root, ordered)

    OUT_PATH.parent.mkdir(parents=True, exist_ok=True)
    if OUT_PATH.exists() and not BACKUP_PATH.exists():
        shutil.copy2(OUT_PATH, BACKUP_PATH)
    OUT_PATH.write_text(json.dumps(data, indent="\t", ensure_ascii=False) + "\n", encoding="utf-8")
    print(f"Wrote {OUT_PATH}")
    print(f"Bodies: {len(data['bodies'])}")
    print(f"Backup: {BACKUP_PATH if BACKUP_PATH.exists() else 'not created'}")


if __name__ == "__main__":
    main()
