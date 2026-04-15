# SolarExtendedRebornPioner

Modernized Sol Extended system mod assets for Pioneer.

This repository contains the legacy Lua source, the converted Pioneer JSON system file, and the conversion helper used to migrate the old `CustomSystem` / `CustomSystemBody` Sol mod into the current JSON custom-system format.

## Included files

- `00_sol.lua`: original legacy Lua system definition.
- `00_sol.json`: converted JSON system definition for current Pioneer builds.
- `convert_sol_extended.py`: scoped converter for regenerating `00_sol.json` from the legacy Lua file.

## Conversion summary

The conversion keeps the extended Sol hierarchy and updates the data into the modern JSON system format expected by current Pioneer releases.

### Corrected fields

| Field | Problem | Correction |
| --- | --- | --- |
| `Sedna:radius` | `f(867,1000000)` produced an unrealistically tiny body | corrected to a realistic Sedna scale |
| `Ceres:ice_cover` | `f(100,1)` overflow-style value | corrected to `10%` ice cover |
| `Eris:radius` | float-like value inside `f()` | corrected to an integer ratio |
| `FarFarOut:semi_major_axis` | old value placed it too close | corrected to a distant trans-Neptunian orbit |
| `Sol:long_desc` | placeholder text | replaced with a real system description |

### Added bodies

New moons:

- Mimas
- Enceladus
- Epimetheus
- Miranda
- Larissa

New solar-system bodies:

- 624 Hektor
- 588 Achilles
- 617 Patroclus
- Ixion
- Varuna
- Arrokoth

Total added bodies: 11.

## Installing

Copy `00_sol.json` to:

```text
Documents/Pioneer/mods/00_sol_EXTENDED/data/systems/custom/00_sol.json
```

Keep legacy Lua system files out of `data/systems` when using the JSON version, otherwise Pioneer may still load the old definition.
