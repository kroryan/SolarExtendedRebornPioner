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
| Surface starports and colonies | 109 |
| Orbital starports and stations | 32 |

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

The system includes 109 surface locations:

- Hespestos's Forge
- Isengard
- New Bourke
- Hespestos's Hammer
- Ephyra Port
- Near Earth Belter Bar
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
- Phobos Base
- Tomm's Sanctuary
- Eros Base
- Pallas Base
- Vesta Base
- Hygiea City
- Occator Domes
- Medena City
- Tyche Domes
- Tycho Base
- Anubis Outpost
- Pemba Post
- Tito Outpost
- Mavis Point
- Božněmcová Port
- Thebe Gas Refinery
- Dante's Base
- Enki Catena
- Moria Domes
- Hektor Waystation
- Achilles Outpost
- Patroclus Mining Camp
- Snelton Observatory
- Tiger Stripe Base
- Maneo Landing
- Oasis City
- Port Makenzie
- Phoebe Research Centre
- Hyperion Cantos
- Janus Dome
- Chariklo Outpost
- Arden Base
- Weaver Science Outpost
- Chiron Outpost
- Artifact's Edge
- Pluto Research Base
- Ixion Post
- Moai Landing
- Pele Landing
- Kapo Base
- Kaha'ula City
- Laumiha Colony
- Gonggong Base
- Xiangliu Base
- Varuna Relay
- Out Nowhere
- Chingichngish
- Weywot Base
- New Horizons Memorial
- Palatine City
- New Chiusi
- Mineral Research Base
- Salacia Colony
- Nereid Outlook
- New Longyearbyen
- Farpoint Base
- Barbary Landing
- Out Woop Woop

## Orbital Stations

The system includes 32 orbital stations:

- Helios Station
- Ikarus's Rest
- Deadalus's PitStop
- Venusia Habitation
- International Space Station
- Gateway Spaceport
- Gates Spaceport
- Jobs Pad
- Torvalds Platform
- Armstrong Station
- Fortuna Station
- Mars High
- Proserpina Station
- RichDig Orbital
- Tycho Station
- Clarke's Station
- Discovery Base
- Hektor Orbital
- Cassini Station
- Daniel's Haven
- Verona Station
- Poseidon Station
- Ahu Tongariki
- Kauakahi Port
- Villi Port
- Wiyot Port
- Charun Habitat
- Qesakoloniya
- Trondheim II
- Rleyh Outpost
- Barbarosa Hideout
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
