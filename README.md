# SolarExtendedRebornPioner

SolarExtendedRebornPioner is a modernized Sol Extended system mod for Pioneer.

It keeps the old hand-written Sol Extended Lua system as source material, ships a converted JSON system for current Pioneer builds, and includes the converter used to rebuild the JSON from the legacy format.

## What This Contains

The converted system file, `00_sol.json`, defines a full extended Sol system with 235 total entries:

| Type | Count |
| --- | ---: |
| Star | 1 |
| Terrestrial planets, dwarf planets, moons, and TNOs | 43 |
| Asteroids, small moons, Trojans, and minor bodies | 46 |
| Gas giants | 4 |
| Surface starports and colonies | 56 |
| Orbital starports and stations | 85 |

## Files

- `00_sol.json`: modern Pioneer JSON system definition. This is the file to install for current Pioneer.
- `00_sol.lua`: original legacy Lua system definition kept for reference and regeneration.
- `convert_sol_extended.py`: converter used to migrate the old `CustomSystem` / `CustomSystemBody` Lua syntax to JSON.
- `README.md`: this documentation.

## Install

Use the JSON file, not the Lua file.

Copy:

```text
00_sol.json
```

to:

```text
Documents/Pioneer/mods/00_sol_EXTENDED/data/systems/custom/00_sol.json
```

Important: keep old Lua system files out of `Documents/Pioneer/mods/00_sol_EXTENDED/data/systems`. Pioneer can still recurse through that folder and load legacy Lua definitions, which can make the game appear to ignore the JSON version.

## Full System Inventory

### Star

- Sol

### Inner System

- Mercury
- 2212 Hephaistos
- 1866 Sisyphus
- 3200 Pheathon
- 1999 JM8
- Venus
- Earth
- Luna
- Mars
- Phobos
- Deimos

### Main Belt and Near-Mars Objects

- Eros
- Pallas
- Vesta
- Hygiea
- Ceres
- Psyche
- Tyche
- Tycho Brahe
- Anubis
- 1429 Pemba
- 1550 Tito
- 1607 Mavis
- 3628 Božněmcová

### Jupiter System

- Jupiter
- Metis
- Adrastea
- Amalthea
- Thebe
- Io
- Europa
- Ganymede
- Callisto
- Themisto
- Leda
- Himalia
- Lysithea
- Elara
- Aega
- 1995 SN55

### Jupiter Trojans

- 624 Hektor
- 588 Achilles
- 617 Patroclus

### Saturn System

- Saturn
- Ymir
- Mimas
- Enceladus
- Tethys
- Dione
- Rhea
- Titan
- Iapetus
- Phoebe
- Hyperion
- Janus
- Epimetheus

### Uranus System

- Uranus
- Miranda
- Ariel
- Umbriel
- Titania
- Oberon

### Neptune System

- Neptune
- Larissa
- Proteus
- Triton
- Nereid

### Centaurs, Kuiper Belt, and Outer System

- Chariklo
- Chiron
- Nessus
- Pluto
- Charon
- Ixion
- Makemake
- MK2
- Haumea
- Hi'aka
- Namaka
- Gonggong
- Xiangliu
- Varuna
- Quaoar
- Weywot
- Arrokoth
- Orcus
- Vanth
- Salacia
- Actaea
- 2002 MS4
- Sedna
- Eris
- Dysnomia
- FarFarOut

## Surface Starports and Colonies

The system includes 56 surface locations:

- Hespestos's Forge
- Isengard
- New Bourke
- London
- Stockholm
- Reykjavík
- Riga
- Sofia
- Athens
- Rome
- Barcelona
- Amsterdam
- Moscow
- Samarkand
- Tokyo
- Shanghai
- Singapore
- Alexandria
- Dakar
- Addis Ababa
- Tshwane Pretoria
- Kuwait City
- Beirut
- Medina
- Colombo
- Melbourne
- Perth
- Wellington
- Honolulu
- Toronto
- New York
- Los Angeles
- Seattle
- Vancouver
- Miami
- Chicago
- Mexico City
- Lima
- Santiago
- Buenos Aires
- Rio De Janeiro
- Havana
- Ferraz Research Station
- Tranquility Base
- Mariasurīru
- Bradbury Landing
- Cydonia
- Olympus Mons
- Occator Domes
- Medena City
- Oasis City
- Port Makenzie
- Pluto Research Base
- Gonggong Base
- Mineral Research Base
- Salacia Colony

## Orbital Stations

The system includes 85 orbital stations and orbitalized outposts. Several legacy surface bases on very rough or unstable procedural terrain are intentionally orbitalized to avoid Pioneer automatically relocating pads or reporting them as underwater.

- Helios Station
- Ikarus's Rest
- Deadalus's PitStop
- Hespestos's Hammer
- Ephyra Port
- Near Earth Belter Bar
- Venusia Habitation
- International Space Station
- Gateway Spaceport
- Gates Spaceport
- Jobs Pad
- Torvalds Platform
- Armstrong Station
- Fortuna Station
- Mars High
- Phobos Base
- Tomm's Sanctuary
- Eros Base
- Pallas Base
- Vesta Base
- Hygiea City
- Proserpina Station
- RichDig Orbital
- Tyche Domes
- Tycho Base
- Tycho Station
- Anubis Outpost
- Pemba Post
- Tito Outpost
- Mavis Point
- Božněmcová Port
- Thebe Gas Refinery
- Dante's Base
- Clarke's Station
- Enki Catena
- Moria Domes
- Discovery Base
- Hektor Waystation
- Hektor Orbital
- Achilles Outpost
- Patroclus Mining Camp
- Snelton Observatory
- Cassini Station
- Tiger Stripe Base
- Maneo Landing
- Daniel's Haven
- Phoebe Research Centre
- Hyperion Cantos
- Janus Dome
- Chariklo Outpost
- Verona Station
- Arden Base
- Weaver Science Outpost
- Chiron Outpost
- Poseidon Station
- Artifact's Edge
- Ixion Post
- Moai Landing
- Ahu Tongariki
- Pele Landing
- Kapo Base
- Kauakahi Port
- Kaha'ula City
- Laumiha Colony
- Villi Port
- Xiangliu Base
- Varuna Relay
- Out Nowhere
- Chingichngish
- Wiyot Port
- Weywot Base
- New Horizons Memorial
- Palatine City
- Charun Habitat
- New Chiusi
- Qesakoloniya
- Nereid Outlook
- New Longyearbyen
- Trondheim II
- Farpoint Base
- Rleyh Outpost
- Barbary Landing
- Barbarosa Hideout
- Out Woop Woop
- FarAway Station

## Notable Additions and Fixes

### Data Fixes

| Field | Problem | Correction |
| --- | --- | --- |
| `Sedna:radius` | legacy value made Sedna unrealistically tiny | corrected to a realistic dwarf-planet scale |
| `Ceres:ice_cover` | `f(100,1)` was far outside the expected range | corrected to a sane fractional ice-cover value |
| `Eris:radius` | old ratio used a float-like value inside `f()` | corrected to an integer-ratio value |
| `FarFarOut:semi_major_axis` | old value placed it too close to the Sun | corrected to a distant outer-system orbit |
| `Sol:long_desc` | placeholder text | replaced with a real Sol system description |
| Legacy nested moon outposts | several bases were accidentally parented to Jupiter, Saturn, Uranus, Gonggong, Quaoar, Orcus, Salacia, or Haumea instead of their moons | repaired parent-child hierarchy |
| Rough-terrain surface bases | Pioneer relocated or rejected many pads as buried/underwater | converted unstable legacy outposts to orbital stations |

### Added Moons

- Mimas
- Enceladus, including Tiger Stripe Base and Cassini Station
- Epimetheus
- Miranda, including Arden Base and Verona Station
- Larissa

### Added Minor Bodies

- 624 Hektor
- 588 Achilles
- 617 Patroclus
- Ixion
- Varuna
- Arrokoth

## Converter Notes

`convert_sol_extended.py` is intentionally scoped to this mod. It handles the legacy Pioneer custom-system style:

- `CustomSystem:new(...)`
- `CustomSystemBody:new(...)`
- chained body fields such as `:radius(...)`, `:mass(...)`, `:semi_major_axis(...)`, `:latitude(...)`, `:longitude(...)`, `:rings(...)`, and `:height_map(...)`
- nested `s:bodies(...)` hierarchy reconstruction

Run it from the repository root that contains the expected Pioneer source layout and legacy Lua file.

```powershell
python tools\convert_sol_extended.py
```

The generated JSON is intended for current Pioneer releases using JSON custom systems.
