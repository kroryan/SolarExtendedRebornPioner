-- Copyright © 2008-2021 Pioneer Developers. See AUTHORS.txt for details
-- Licensed under the terms of the GPL v3. See licenses/GPL-3.txt
-- NOTE TO SELF, rotation_period(0.00000soOn, 1) causes a crash, will have to ammend

local s = CustomSystem:new('Sol', { 'STAR_G' })
	:govtype('EARTHDEMOC')
	:lawlessness(f(1,100)) -- 1/100th from a peaceful eden
	:short_desc('The historical birthplace of humankind')
	:long_desc([[Sol is a G-type main-sequence star and the centre of humanity's home system. At the turn of the 31st century, Sol remains the most densely populated system in human space, with billions of inhabitants spread across Earth, the terraformed Mars, orbital habitats, and colonies throughout the belt and outer planets. The inner system is a bustling crossroads of trade and politics, while the outer reaches — from the gas giants to the distant scattered disc — host frontier settlements, research outposts, and the quiet hum of deep-space industry.]])

local sol = CustomSystemBody:new('Sol', 'STAR_G')
	:seed(191512)
	:radius(f(1,1))
	:mass(f(1,1))
	:temp(5772)
	:rotation_period(f(2505,100))
	:axial_tilt(fixed.deg2rad(f(4222586566496537,10000000000000000)))
	:atmos_density(f(1,10000000000000))

local heliosStation = CustomSystemBody:new('Helios Station', 'STARPORT_ORBITAL')
		:semi_major_axis(f(100,1000))
		:rotation_period(f(2505,100))
		:orbital_phase_at_start(fixed.deg2rad(f(348,1)))

local mercury = CustomSystemBody:new('Mercury', 'PLANET_TERRESTRIAL')
	:seed(135183211825)
	:radius(f(38,100))
	:mass(f(55,1000))
	:temp(452.039)
	:semi_major_axis(f(387,1000))
	:eccentricity(f(205,1000))
	:inclination(math.deg2rad(7.0))
	:rotation_period(f(59,1))
	:axial_tilt(fixed.deg2rad(f(1,100)))
	:metallicity(f(6,10))
	:volcanicity(f(1,2))
	:atmos_density(f(98692326671601283000246730816679, (10 ^ 44)))
	:atmos_oxidizing(f(0,1))
	:ocean_cover(f(0,1))
	:ice_cover(f(2,1000))
	:life(f(0,1))
	:orbital_phase_at_start(fixed.deg2rad(f(286,1)))
	
local mercury_starports = {

			CustomSystemBody:new('Hespestos\'s Forge', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(14.000))
				:longitude(math.deg2rad(-100)),
			CustomSystemBody:new('Isengard', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(12))
				:longitude(math.deg2rad(79.2)),
			CustomSystemBody:new('New Bourke', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(5))
				:longitude(math.deg2rad(-180)),
			CustomSystemBody:new('Ikarus\'s Rest', 'STARPORT_ORBITAL')
				:semi_major_axis(f(5068,100000000))
				:rotation_period(f(11,24)),
			CustomSystemBody:new('Deadalus\'s PitStop', 'STARPORT_ORBITAL')
				:semi_major_axis(f(7000,100000000))
				:rotation_period(f(11,24))
				:orbital_phase_at_start(fixed.deg2rad(f(248,1))),

}

local hephaistos = CustomSystemBody:new('2212 Hephaistos', 'PLANET_ASTEROID')
	:seed(851681919201519)
	:radius(f(447,1000000)) -- 2.85 km mean
	:mass(f(56,1000000000)) -- 6.687e15 kg
	:temp(300)
	:semi_major_axis(f(2159,1000)) -- 2.159 AU
	:eccentricity(f(83,100)) -- 0.83757618
	:inclination(math.deg2rad(11.5582329)) -- 11.558°
	:rotation_period(f(83,100)) -- 20h
	:metallicity(f(7,10))
	:orbital_phase_at_start(fixed.deg2rad(f(230,1))) -- random, to get it away from Luna

local hephaistos_starports = {

			CustomSystemBody:new('Hespestos\'s Hammer', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(51.5074))
				:longitude(math.deg2rad(0.1278))
}

local sisyphus = CustomSystemBody:new('1866 Sisyphus', 'PLANET_ASTEROID')
	:seed(19919251682119)
	:radius(f(698,1000000)) -- 4.45 km mean
	:mass(f(112,1000000000)) -- 6.687e15 kg
	:temp(300)
	:semi_major_axis(f(18936992,10000000)) -- 1.89 AU
	:eccentricity(f(5386,10000)) -- 0.83757618
	:inclination(math.deg2rad(41.202)) -- 11.558°
	:rotation_period(f(996208333,10000000000)) -- 2.39 h
	:metallicity(f(1,10))
	:orbital_phase_at_start(fixed.deg2rad(f(230,1))) -- random, to get it away from Luna

local sisyphus_starports = {
			CustomSystemBody:new('Ephyra Port', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(51.5074))
				:longitude(math.deg2rad(0.1278))
}

local pheathon = CustomSystemBody:new('3200 Pheathon', 'PLANET_ASTEROID')
	:seed(168512081514)
	:radius(f(455,1000000)) -- 2.9 km mean
	:mass(f(80,100000000000)) -- 6.687e15 kg
	:temp(300)
	:semi_major_axis(f(18936992,10000000)) -- 1.89 AU
	:eccentricity(f(88990,100000)) -- 0.88990
	:inclination(math.deg2rad(22.260)) -- 11.558°
	:rotation_period(f(1502,10000)) -- 3.604 h
	:metallicity(f(1,10))
	:orbital_phase_at_start(fixed.deg2rad(f(230,1))) -- random, to get it away from Luna

--Comes in way too close to the sun for any rock hopping colonist to consider it.

local JM8 = CustomSystemBody:new('1999 JM8', 'PLANET_ASTEROID')
	:seed(10138)
	:radius(f(549,1000000)) -- 3.5 km mean
	:mass(f(100,10000000000)) -- 6.687e15 kg
	:temp(290)
	:semi_major_axis(f(27261,10000)) -- 2.7261 AU
	:eccentricity(f(6411,10000)) -- 0.6411
	:inclination(math.deg2rad(13.829)) -- 11.558°
	:rotation_period(f(566667,100000)) -- 136 h
	:metallicity(f(4,10))
	:orbital_phase_at_start(fixed.deg2rad(f(230,1))) -- random, to get it away from Luna

local JM8_starports = {
			CustomSystemBody:new('Near Earth Belter Bar', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(51.5074))
				:longitude(math.deg2rad(0.1278))
}

local venus = CustomSystemBody:new('Venus', 'PLANET_TERRESTRIAL')
	:seed(225142119)
	:radius(f(95,100))
	:mass(f(815,1000))
	:temp(735)
	:semi_major_axis(f(723,1000))
	:eccentricity(f(7,1000))
	:inclination(math.deg2rad(3.39))
	:rotation_period(f(243,1))
	:axial_tilt(fixed.deg2rad(f(26,10)))
	:metallicity(f(1,2))
	:volcanicity(f(8,10))
	:atmos_density(f(53,1))
	:atmos_oxidizing(f(12,100))
	:ocean_cover(f(0,1))
	:ice_cover(f(0,1))
	:life(f(0,1))
	:orbital_phase_at_start(fixed.deg2rad(f(248,1)))
	
local venus_starports = {
	
		CustomSystemBody:new('Venusia Habitation', 'STARPORT_ORBITAL')
			:seed(1)
			:semi_major_axis(f(200,100000))
			:rotation_period(f(1,24*60*3))
			:orbital_phase_at_start(fixed.deg2rad(f(0,1)))
	
	}

local earth = CustomSystemBody:new('Earth', 'PLANET_TERRESTRIAL')
	:radius(f(1,1))
	:mass(f(1,1))
	:temp(288)
	:semi_major_axis(f(1,1))
	:eccentricity(f(167,10000))
	:rotation_period(f(1,1))
	:axial_tilt(fixed.deg2rad(f(2344,100)))
	:rotational_phase_at_start(fixed.deg2rad(f(170,1)))
	:height_map('earth.hmap',0)
	:metallicity(f(1,2))
	:volcanicity(f(1,10))
	:atmos_density(f(1,1))
	:atmos_oxidizing(f(99,100))
	:ocean_cover(f(7,10))
	:ice_cover(f(5,10))
	:life(f(9,10))
	:orbital_phase_at_start(fixed.deg2rad(f(336,1)))

local earth_groundbases_BDS = {
				--Europe
				--The Isles
			CustomSystemBody:new('London', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(51.5074))
				:longitude(math.deg2rad(0.1278)),

				--Scandanavia
			CustomSystemBody:new('Stockholm', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(59.9139))
				:longitude(math.deg2rad(-18.0686)),
				--NorthSea
			CustomSystemBody:new('Reykjavík', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(64.1466))
				:longitude(math.deg2rad(21.9426)),
				--East Europe
			CustomSystemBody:new('Riga', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(56.9496))
				:longitude(math.deg2rad(-24.1052)),
				--Central Europe
			CustomSystemBody:new('Sofia', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(42.6977))
				:longitude(math.deg2rad(-23.3219)),
				--Greek_Penninsula
			CustomSystemBody:new('Athens', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(37.9838))
				:longitude(math.deg2rad(-23.7275)),
				--Italy
			CustomSystemBody:new('Rome', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(41.9028))
				:longitude(math.deg2rad(-12.4964)),
				--Iberia

			CustomSystemBody:new('Barcelona', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(41.3851))
				:longitude(math.deg2rad(2.1734)),
				-- Belgium & the Netherlands
			CustomSystemBody:new('Amsterdam', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(52.3667))
				:longitude(math.deg2rad(-4.8945)),
				--Russia
				--Central Russia
			CustomSystemBody:new('Moscow', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(55.7558))
				:longitude(math.deg2rad(-37.6173)),
				--Central Asia
			CustomSystemBody:new('Samarkand', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(39.6270))
				:longitude(math.deg2rad(-66.9750)),
				--Japan
			CustomSystemBody:new('Tokyo', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(35.6762))
				:longitude(math.deg2rad(-139.6503)),
				--East Asia
			CustomSystemBody:new('Shanghai', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(31.2304))
				:longitude(math.deg2rad(-121.4737)),
				--South East Asia
			CustomSystemBody:new('Singapore', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(1.3521))
				:longitude(math.deg2rad(-103.8198)),
				--Africa
				--North Africa
			CustomSystemBody:new('Alexandria', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(31.2001))
				:longitude(math.deg2rad(-29.9187)),
				--West Africa
			CustomSystemBody:new('Dakar', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(14.7167))
				:longitude(math.deg2rad(17.4677)),
				--East Africa
			CustomSystemBody:new('Addis Ababa', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(8.9806))
				:longitude(math.deg2rad(-38.7578)),
				--South Africa
			CustomSystemBody:new('Tshwane Pretoria', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(-25.7479))
				:longitude(math.deg2rad(-28.2293)),
				--Middle East
				--Fertile Crescent
			CustomSystemBody:new('Kuwait City', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(29.3759))
				:longitude(math.deg2rad(-47.9774)),
				--Levantine
			CustomSystemBody:new('Beirut', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(33.8938))
				:longitude(math.deg2rad(-35.5018)),
				--Arabia
			CustomSystemBody:new('Medina', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(24.5247))
				:longitude(math.deg2rad(-39.5692)),
			CustomSystemBody:new('Colombo', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(6.9271))
				:longitude(math.deg2rad(-79.8612)),
				--Pacific
				--Oztraalyaa
			CustomSystemBody:new('Melbourne', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(-37.7157))
				:longitude(math.deg2rad(-144.9631)),
			CustomSystemBody:new('Perth', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(-31.9505))
				:longitude(math.deg2rad(-115.8605)),
				--Aotearoa
			CustomSystemBody:new('Wellington', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(-41.2769))
				:longitude(math.deg2rad(-174.7731)),
				--Pacific Islands
			CustomSystemBody:new('Honolulu', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(21.3069))
				:longitude(math.deg2rad(157.8583)),
				--America
				--North America
				--Canadia
			CustomSystemBody:new('Toronto', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(43.6532))
				:longitude(math.deg2rad(79.3832)),
				--East Coast
			CustomSystemBody:new('New York', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(40.7128))
				:longitude(math.deg2rad(77.0369)),
				--West Coast
			CustomSystemBody:new('Los Angeles', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(34.0522))
				:longitude(math.deg2rad(118.2437)),
			CustomSystemBody:new('Seattle', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(47.6062))
				:longitude(math.deg2rad(122.3321)),
			CustomSystemBody:new('Vancouver', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(49.2827))
				:longitude(math.deg2rad(123.1207)),
				--Deep South
			CustomSystemBody:new('Miami', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(25.7617))
				:longitude(math.deg2rad(80.1918)),
				--Great Lakes
			CustomSystemBody:new('Chicago', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(41.8781))
				:longitude(math.deg2rad(87.6298)),
				--Central America
			CustomSystemBody:new('Mexico City', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(19.4326))
				:longitude(math.deg2rad(99.1332)),
				--South America
			CustomSystemBody:new('Lima', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(-12.0464))
				:longitude(math.deg2rad(77.0428)),
			CustomSystemBody:new('Santiago', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(-33.4489))
				:longitude(math.deg2rad(70.6693)),
			CustomSystemBody:new('Buenos Aires', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(-34.6037))
				:longitude(math.deg2rad(58.3816)),
			CustomSystemBody:new('Rio De Janeiro', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(-22.9068))
				:longitude(math.deg2rad(43.1729)),
				--Caribbean
			CustomSystemBody:new('Havana', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(23.1136))
				:longitude(math.deg2rad(82.3666)),
				--Antarctica
			CustomSystemBody:new('Ferraz Research Station', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(-62.0854))
				:longitude(math.deg2rad(58.3913)),
}

local earthOrbit_starports = {
	CustomSystemBody:new('International Space Station', 'STARPORT_ORBITAL')
		:seed(1)
		:semi_major_axis(f(453616,10000000000))
		:rotation_period(f(625,10000))
		:inclination(math.deg2rad(51.6))
		:orbital_phase_at_start(fixed.deg2rad(f(0,1))),
	CustomSystemBody:new('Gateway Spaceport', 'STARPORT_ORBITAL')
		:seed(1)
		:semi_major_axis(f(128477764,100000000000))
		:rotation_period(f(301679,10000))
		:inclination(math.deg2rad(5.145))
		:orbital_phase_at_start(fixed.deg2rad(f(0,1))),
	CustomSystemBody:new('Gates Spaceport', 'STARPORT_ORBITAL')
		:seed(1)
		:semi_major_axis(f(200,100000))
		:rotation_period(f(1,24*60*3)),
	CustomSystemBody:new('Jobs Pad', 'STARPORT_ORBITAL')
		:seed(13)
		:semi_major_axis(f(600,100000))
		:rotation_period(f(1,24*60*3)),
	CustomSystemBody:new('Torvalds Platform', 'STARPORT_ORBITAL')
		:seed(0)
		:semi_major_axis(f(5.0,100000))
		:rotation_period(f(1,24*60*3))
		:orbital_phase_at_start(fixed.deg2rad(f(0,1))),
}


local luna = {
	CustomSystemBody:new('Luna', 'PLANET_TERRESTRIAL')
		:seed(-1221141)
		:radius(f(273,1000))
		:mass(f(12,1000))
		:temp(220)
		:semi_major_axis(f(257,100000))
		:eccentricity(f(549,10000))
		:height_map('moon.hmap',1)
		:inclination(math.deg2rad(5.145))
		:rotation_period(f(273,10))
		:axial_tilt(fixed.deg2rad(f(668,100)))
		:orbital_phase_at_start(fixed.deg2rad(f(0,1)))
		:rotational_phase_at_start(fixed.deg2rad(f(0,1)))
		:metallicity(f(9,10))
		:volcanicity(f(0,1)),
	{
		CustomSystemBody:new('Tranquility Base', 'STARPORT_SURFACE')
			:latitude(math.deg2rad(0.6875))
			:longitude(math.deg2rad(23.4334)),
		CustomSystemBody:new('Mariasurīru', 'STARPORT_SURFACE')
			:latitude(math.deg2rad(14.000))
			:longitude(math.deg2rad(-303.2))
			:space_station_type("ground_station"),
		CustomSystemBody:new('Armstrong Station', 'STARPORT_ORBITAL')
			:semi_major_axis(f(5068,100000000))
			:rotation_period(f(1,1)),
	}
}

local fortuna = CustomSystemBody:new('Fortuna Station', 'STARPORT_ORBITAL')
		:seed(1)
		:semi_major_axis(f(1261840,1000000))
		:inclination(math.deg2rad(0.925))
		:rotation_period(f(513,500))
		:orbital_phase_at_start(fixed.deg2rad(f(162,1)))


local mars = CustomSystemBody:new('Mars', 'PLANET_TERRESTRIAL')
	:seed(-1311819)
	:radius(f(531.424772,1000))
	:mass(f(107,1000))
	:temp(278)
	:semi_major_axis(f(1523679,1000000))
	:eccentricity(f(933,10000))
	:height_map('mars.hmap',0)  --
	:inclination(math.deg2rad(1.85))
	:rotation_period(f(1027,1000))
	:axial_tilt(fixed.deg2rad(f(2519,100)))
	-- XXX composition copied from earth until there's a way to indicate terraformed
	:metallicity(f(14.5,5))
	:volcanicity(f(2,10))
	:atmos_density(f(489,1000))
	:atmos_oxidizing(f(950001,1000000))
	:ocean_cover(f(10,100))
	:ice_cover(f(440,1000))
	:life(f(10,100))
	:orbital_phase_at_start(fixed.deg2rad(f(12,1)))

local mars_starports = {
	CustomSystemBody:new('Bradbury Landing', 'STARPORT_SURFACE')
		:latitude(math.deg2rad(-4.5895))
		:longitude(math.deg2rad(-137.4417)),
	CustomSystemBody:new('Cydonia', 'STARPORT_SURFACE')
		:latitude(math.deg2rad(-29))
		:longitude(math.deg2rad(124)),
	CustomSystemBody:new('Olympus Mons', 'STARPORT_SURFACE')
		:latitude(math.deg2rad(25.60955))
		:longitude(math.deg2rad(-41.35269)),
	CustomSystemBody:new('Mars High', 'STARPORT_ORBITAL')
		:semi_major_axis(f(5068,100000000))
		:rotation_period(f(11,24)),
}

local mars_moons = {
	CustomSystemBody:new('Phobos', 'PLANET_ASTEROID')
		:seed(1681521519)
		:radius(f(21,10000))
		:mass(f(1775,1000000000000)) -- 10.6e15 kg = 1.775e-9 EM
		:semi_major_axis(f(627,10000000))
		:rotation_period(f(319,1000))
		:temp(233)
		:eccentricity(f(151,10000))
		:inclination(math.deg2rad(1.093))
		:metallicity(f(4,5))
		:volcanicity(f(3,4)),
	{
		CustomSystemBody:new('Phobos Base', 'STARPORT_SURFACE')
			:latitude(math.deg2rad(5))
			:longitude(math.deg2rad(-5)),
	},
	CustomSystemBody:new('Deimos', 'PLANET_ASTEROID')
		:seed(4591319)
		:radius(f(12,10000))
		:mass(f(247,1000000000000)) -- 1.48e15 kg = 2.47e-10 EM - comes out as 1
		:semi_major_axis(f(1568,10000000))
		:rotation_period(f(1263,1000))
		:temp(233)
		:eccentricity(f(2,10000))
		:inclination(math.deg2rad(0.93))
		:metallicity(f(7,10))
		:volcanicity(f(1,1)),
	{
		CustomSystemBody:new('Tomm\'s Sanctuary', 'STARPORT_SURFACE'),
	},
}

local eros = CustomSystemBody:new('Eros', 'PLANET_ASTEROID')
	:seed(5181519)
	:radius(f(0005393405,1000000000)) -- 16.84km mean
	:mass(f(112,100000000000)) -- 6.687e15 kg
	:temp(164)
	:semi_major_axis(f(1458,1000)) -- 1.458 AU
	:eccentricity(f(223,1000)) -- 0.223
	:inclination(math.deg2rad(10.829)) -- 10.829°
	:rotation_period(f(2194,10000)) -- 5h16m
	:metallicity(f(7,10))
	:orbital_phase_at_start(fixed.deg2rad(f(230,1))) -- random, to get it away from Luna
	
local eros_starports = {
			CustomSystemBody:new('Eros Base', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(5))
				:longitude(math.deg2rad(-5)),
	}

local pallas = CustomSystemBody:new('Pallas', 'PLANET_ASTEROID')
	:seed(1611212119)
	:radius(f(08,100)) -- 512km
	:mass(f(353,10000000)) -- 2.11e20 kg
	:temp(164)
	:semi_major_axis(f(27716,10000)) -- 2.7716 AU
	:eccentricity(f(23127,100000)) -- 0.23127
	:inclination(math.deg2rad(34.84)) -- 34.84°
	:rotation_period(f(32555,100000)) -- 7.8h
	:axial_tilt(fixed.deg2rad(f(84,1))) -- 84°
	
local pallas_starports = {

			CustomSystemBody:new('Pallas Base', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(5))
				:longitude(math.deg2rad(-5)),

	}

local vesta = CustomSystemBody:new('Vesta', 'PLANET_ASTEROID')
	:seed(22519201)
	:radius(f(082,1000)) -- 525km
	:mass(f(4338,100000000)) -- 2.590e20 kg
	:temp(177) -- 85 - 270K
	:semi_major_axis(f(236179,100000)) -- 2.36179 AU
	:eccentricity(f(08874,100000)) -- 0.08874
	:inclination(math.deg2rad(7.14043)) -- 7.14043°
	:rotation_period(f(2226,10000)) -- 5.342h
	:axial_tilt(fixed.deg2rad(f(29,1))) -- 29°
	:ice_cover(f(1,10))
	:metallicity(f(3,10))
	
local vesta_starports = {

			CustomSystemBody:new('Vesta Base', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(5))
				:longitude(math.deg2rad(-5)),

	}

local hygiea = CustomSystemBody:new('Hygiea', 'PLANET_ASTEROID')
	:seed(8257951)
	:radius(f(6.75743475,100))
	:mass(f(3338,100000000))
	:temp(177) -- 85 - 270K
	:semi_major_axis(f(31416,10000)) -- 3.1416 AU
	:eccentricity(f(01125,100000)) -- 0.08874
	:inclination(math.deg2rad(3.8316)) -- 7.14043°
	:rotation_period(f(115095833,100000000)) -- 27 hours
	:axial_tilt(fixed.deg2rad(f(60,1))) -- 60°
	:metallicity(f(3,10))
	
local hygiea_starports = {

			CustomSystemBody:new('Hygiea City', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(5))
				:longitude(math.deg2rad(-5)),

	}

local ceres = CustomSystemBody:new('Ceres', 'PLANET_TERRESTRIAL')
	:seed(-3518519)
	:radius(f(736468972,10000000000)) -- 473km
	:mass(f(15,100000)) -- 9.393e20 kg
	:temp(168)
	:ice_cover(f(1,10)) -- ~10% ice, bright spots (hydrated salts)
	:semi_major_axis(f(27675,10000)) -- 2.7675 AU
	:eccentricity(f(758,10000)) -- 0.075823
	:inclination(math.deg2rad(10.593)) -- 10.593°
	:rotation_period(f(3781,10000)) -- 9h
	:axial_tilt(fixed.deg2rad(f(4,1))) -- 4°
	
local ceres_starports = {
			CustomSystemBody:new('Occator Domes', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(14.000))
				:longitude(math.deg2rad(-303.2)),
			CustomSystemBody:new('Medena City', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(-14.000))
				:longitude(math.deg2rad(303.2)),
			CustomSystemBody:new('Proserpina Station', 'STARPORT_ORBITAL')
				:semi_major_axis(f(5068,100000000))
				:rotation_period(f(11,24)),
	}

local psyche = CustomSystemBody:new('Psyche', 'PLANET_ASTEROID')
	:seed(161925385)
	:radius(f(174032,10000000)) -- 111km
	:mass(f(46431,100000000)) -- 0.00046431 Earth masses
	:temp(163.92)
	:metallicity(1,1)
	:semi_major_axis(f(2921,1000)) -- 2.921 AU
	:eccentricity(f(140,1000)) -- 0.140
	:inclination(math.deg2rad(3.095)) -- 3.095°
	:rotation_period(f(17483116667,100000000000)) -- 4h
	:axial_tilt(fixed.deg2rad(f(4,1))) -- 4°

local psyche_starports = {

			CustomSystemBody:new('RichDig Orbital', 'STARPORT_ORBITAL')
				:semi_major_axis(f(10857,10000000000))
				:rotation_period(f(1,1)),

	}

local tyche = CustomSystemBody:new('Tyche', 'PLANET_ASTEROID')
	:seed(2025385)
	:radius(f(500146,100000000)) -- 31.8km
	:mass(f(58119,10000000000)) -- 0.00000000001 Earth masses
	:temp(156.05)
	:semi_major_axis(f(26175,10000)) -- 2.6175 AU
	:eccentricity(f(20390,100000)) -- 0.140
	:inclination(math.deg2rad(14.305)) -- 14.305°
	:rotation_period(f(4184,10000)) -- 10 hours
	:axial_tilt(fixed.deg2rad(f(1,1))) -- 1°

local tyche_starports = {

			CustomSystemBody:new('Tyche Domes', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(5))
				:longitude(math.deg2rad(-5)),

	}

local tycho = CustomSystemBody:new('Tycho Brahe', 'PLANET_ASTEROID')
	:seed(20253815218175)
	:radius(f(84062,100000000)) -- 5.36 km
	:mass(f(34985,1000000000000)) -- 0.000000034985 Earth masses
	:temp(163.38)
	:ice_cover(f(27.8,100))
	:metallicity(21.6,100)
	:semi_major_axis(f(25322,10000)) -- 2.5322 AU
	:eccentricity(f(1072,10000)) -- 0.1072
	:inclination(math.deg2rad(14.853)) -- 14.853°
	:rotation_period(f(1620833,10000000)) -- 3 hours
	:axial_tilt(fixed.deg2rad(f(1,1))) -- 1°

local tycho_starports = {

			CustomSystemBody:new('Tycho Base', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(5))
				:longitude(math.deg2rad(-5)),

			CustomSystemBody:new('Tycho Station', 'STARPORT_ORBITAL')
				:semi_major_axis(f(10857,10000000000))
				:rotation_period(f(1,1)),
	}

local anubis = CustomSystemBody:new('Anubis', 'PLANET_ASTEROID')
	:seed(114212919)
	:radius(f(7552,10000000)) -- 4.81 km
	:mass(f(24098,1000000000000)) -- 0.000000024098 Earth masses
	:temp(149.16)
	:ice_cover(f(18.7,100))
	:metallicity(36.4,100)
	:semi_major_axis(f(29061,10000)) -- 2.5322 AU
	:eccentricity(f(920,10000)) -- 0.0920
	:inclination(math.deg2rad(3.1576)) -- 3.1576°
	:rotation_period(f(19275,100000)) -- 4.6 hours
	:axial_tilt(fixed.deg2rad(f(1,1))) -- 1°

local anubis_starports = {

			CustomSystemBody:new('Anubis Outpost', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(5))
				:longitude(math.deg2rad(-5)),

	}

local pemba = CustomSystemBody:new('1429 Pemba', 'PLANET_ASTEROID')
	:seed(14291651321)
	:radius(f(8427195,10000000000)) -- 4.81 km
	:mass(f(20582,1000000000000)) -- 0.000000024098 Earth masses
	:temp(149.06)
	:ice_cover(f(16.1,100))
	:metallicity(43.2,100)
	:semi_major_axis(f(25564,10000)) -- 2.5564 AU
	:eccentricity(f(333,1000)) -- 0.333
	:inclination(math.deg2rad(7.7492)) -- 3.1576°
	:rotation_period(f(20,24)) -- 20 hours
	:axial_tilt(fixed.deg2rad(f(12188183945390783,10000000000000000))) -- 1.2°

local pemba_starports = {

			CustomSystemBody:new('Pemba Post', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(5))
				:longitude(math.deg2rad(-5)),

	}

local tito = CustomSystemBody:new('1550 Tito', 'PLANET_ASTEROID')
	:seed(15502092015)
	:radius(f(10702146,10000000000)) -- 6.82 km
	:mass(f(316,10000000000)) -- 0.0000000316Earth masses
	:temp(143.01)
	:ice_cover(f(22.5,100))
	:metallicity(30.8,100)
	:semi_major_axis(f(25434,10000)) -- 2.5434 AU
	:eccentricity(f(314,1000)) -- 0.314
	:inclination(math.deg2rad(8.8802)) -- 3.1576°
	:rotation_period(f(54.53,24)) -- 54.53 hours
	:axial_tilt(fixed.deg2rad(f(2700863080503547,10000000000000000))) -- 0.27°

local tito_starports = {

			CustomSystemBody:new('Tito Outpost', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(5))
				:longitude(math.deg2rad(-5)),

	}

local mavis = CustomSystemBody:new('1607 Mavis', 'PLANET_ASTEROID')
	:seed(160713122919)
	:radius(f(11688324,10000000000)) -- 7.455 km
	:mass(f(44375,1000000000000)) -- 0.00000004475 Earth masses
	:temp(145.15)
	:ice_cover(f(15.9,100))
	:metallicity(37,100)
	:semi_major_axis(f(25513,10000)) -- 2.5513 AU
	:eccentricity(f(303,1000)) -- 0.303
	:inclination(math.deg2rad(8.5789)) -- 8.5789°
	:rotation_period(f(6.1508,24)) -- 6.1508 hours
	:axial_tilt(fixed.deg2rad(f(14551794145649377,100000000000000000))) -- 0.14°

local mavis_starports = {

			CustomSystemBody:new('Mavis Point', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(5))
				:longitude(math.deg2rad(-5)),

	}

local boznemcova = CustomSystemBody:new('3628 Božněmcová', 'PLANET_ASTEROID')
	:seed(362821526513315221)
	:radius(f(6412508,10000000000)) -- 4.09 km
	:mass(f(86875502, (10 ^ 21) )) -- 8.6875502E-11 Earth masses
	:temp(137.48)
	:ice_cover(f(30.2,100))
	:metallicity(37.7,100)
	:semi_major_axis(f(25396,10000)) -- 2.5396 AU
	:eccentricity(f(297,1000)) -- 0.297
	:inclination(math.deg2rad(6.8866)) -- 8.5789°
	:rotation_period(f(3.335410,24)) -- 3.335410 hours
	:axial_tilt(fixed.deg2rad(f(14389510038103177,10000000000000000))) -- 1.43°

local boznemcova_starports = {

			CustomSystemBody:new('Božněmcová Port', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(5))
				:longitude(math.deg2rad(-5)),

	}

local jupiter = CustomSystemBody:new('Jupiter', 'PLANET_GAS_GIANT')
	:seed(102116920518)
	:radius(f(11,1))
	:mass(f(3178,10))
	:temp(165)
	:atmos_density(f(163,100))
	:atmos_oxidizing(f(8,10))
	:semi_major_axis(f(5204,1000))
	:eccentricity(f(488,10000))
	:inclination(math.deg2rad(1.305))
	:rotation_period(f(4,10))
	:axial_tilt(fixed.deg2rad(f(313,100)))
	:rings(f(11176,10000), f(11769,10000), {0.61, 0.48, 0.384, 0.8})
	:orbital_phase_at_start(fixed.deg2rad(f(75,1)))

local jupiter_moons = {

	CustomSystemBody:new('Metis', 'PLANET_ASTEROID')
		:seed(-13520919)
		:radius(f(337,100000))
		:mass(f(633,100000000000)) -- 3.6e16 kg = 6.33e-9 EM
		:semi_major_axis(f(856,1000000))
		:rotation_period(f(2948,10000))
		:temp(123)
		:eccentricity(f(2,10000))
		:inclination(math.deg2rad(1.57))
		:metallicity(f(2,1000))
		:volcanicity(f(0,1))
		:ice_cover(f(100,1)),

	CustomSystemBody:new('Adrastea', 'PLANET_ASTEROID')
		:seed(-14181192051)
		:radius(f(338,100000))
		:mass(f(352,1000000000000)) -- 0.2e16 kg = 3.52e-10 EM
		:semi_major_axis(f(862,1000000))
		:rotation_period(f(2983,10000))
		:temp(122)
		:eccentricity(f(15,10000))
		:inclination(math.deg2rad(0.03))
		:metallicity(f(7,10))
		:volcanicity(f(1,1)),

	CustomSystemBody:new('Amalthea', 'PLANET_ASTEROID')
		:seed(-11311220851)
		:radius(f(13,1000))
		:mass(f(348,1000000000)) -- 208e16 kg = 3.48e-7 EM
		:temp(112)
		:semi_major_axis(f(121,100000))
		:eccentricity(f(3,1000))
		:inclination(math.deg2rad(0.374))
		:rotation_period(f(498179,1000000))
		:metallicity(f(7,10))
		:volcanicity(f(1,1)),


	CustomSystemBody:new('Thebe', 'PLANET_ASTEROID')
		:seed(-208525)
		:radius(f(773,100000))
		:mass(f(72,1000000000)) -- 43e16 kg = 7.2e-8 EM
		:temp(124)
		:semi_major_axis(f(148,100000))
		:eccentricity(f(175,10000))
		:inclination(math.deg2rad(1.076))
		:rotation_period(f(674536,1000000))
		:metallicity(f(7,10))
		:volcanicity(f(1,1)),
	{
		CustomSystemBody:new('Thebe Gas Refinery', 'STARPORT_SURFACE')
			:latitude(math.deg2rad(-0.1))
			:longitude(math.deg2rad(21.2)),
	},

	CustomSystemBody:new('Io', 'PLANET_TERRESTRIAL')
		:seed(-915)
		:radius(f(286,1000))
		:mass(f(15,1000))
		:temp(130)
		:semi_major_axis(f(282,100000))
		:eccentricity(f(41,10000))
		:inclination(math.deg2rad(2.21))
		:rotation_period(f(177,100))
		:metallicity(f(9,10))
		:volcanicity(f(7,10))
		:atmos_density(f(100,1225))
		:atmos_oxidizing(f(12,100))
		:ocean_cover(f(0,1))
		:ice_cover(f(0,1))
		:life(f(1,10)),
	{
		CustomSystemBody:new('Dante\'s Base', 'STARPORT_SURFACE')
			:latitude(math.deg2rad(-56.38))
			:longitude(math.deg2rad(9.51)),
	},
	CustomSystemBody:new('Europa', 'PLANET_TERRESTRIAL')
		:seed(5211815161)
		:radius(f(245,1000))
		:mass(f(8,1000))
		:temp(102)
		:semi_major_axis(f(441,100000))
		:eccentricity(f(9,1000))
		:rotation_period(f(355,100))
		:ocean_cover(f(9,10))
		:ice_cover(f(1,1))
		:atmos_density(f(7,100))
		:atmos_oxidizing(f(1,1))
		:metallicity(f(3,4))
		:volcanicity(f(0,1)),
	{
		CustomSystemBody:new('Clarke\'s Station', 'STARPORT_ORBITAL')
			:semi_major_axis(f(12,500000))
			:rotation_period(f(1,24*60*3)),
	},
	CustomSystemBody:new('Ganymede', 'PLANET_TERRESTRIAL')
		:seed(-71142513545)
		:radius(f(413,1000))
		:mass(f(25,1000))
		:temp(180)
		:atmos_oxidizing(f(1,1))
		:ocean_cover(f(3,10))
		:ice_cover(f(7,10))
		:metallicity(f(3,5))
		:semi_major_axis(f(72,10000))
		:eccentricity(f(13,10000))
		:inclination(math.deg2rad(0.2))
		:atmos_density(f(83,1000))
		:rotation_period(f(72,10)),
	{
		CustomSystemBody:new('Enki Catena', 'STARPORT_SURFACE')
			:latitude(math.deg2rad(84))
			:longitude(math.deg2rad(96)),
	},
	CustomSystemBody:new('Callisto', 'PLANET_TERRESTRIAL')
		:seed(3112129192015)
		:radius(f(378,1000))
		:mass(f(18,1000))
		:temp(134)
		:metallicity(f(1,4))
		:semi_major_axis(f(126,10000))
		:eccentricity(f(74,10000))
		:inclination(math.deg2rad(0.192))
		:rotation_period(f(167,10)),
		{
			CustomSystemBody:new('Moria Domes', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(14.000))
				:longitude(math.deg2rad(-303.2)),
		},

	CustomSystemBody:new('Discovery Base', 'STARPORT_ORBITAL')
		:semi_major_axis(f(14,1000))
		:rotation_period(f(204,10)),

	CustomSystemBody:new('Themisto', 'PLANET_ASTEROID')
		:seed(2085139192015)
		:radius(f(627,1000000))
		:mass(f(115,1000000000000)) -- 6.9e14 kg, 1.15e-10 EM
		:temp(124)
		:semi_major_axis(f(494,10000))
		:eccentricity(f(2006,10000))
		:inclination(math.deg2rad(47.48))
		:rotation_period(f(12982,100))
		:metallicity(f(2,1000))
		:volcanicity(f(0,1)),

	CustomSystemBody:new('Leda', 'PLANET_ASTEROID')
		:seed(-12541)
		:radius(f(156,100000))
		:mass(f(837,1000000000000)) -- 5e15 kg, 8.37e-10 EM
		:temp(124)
		:semi_major_axis(f(745,10000))
		:eccentricity(f(16,100))
		:inclination(math.deg2rad(29.1))
		:rotation_period(f(12982,100))
		:metallicity(f(2,1000))
		:volcanicity(f(0,1))
		:orbital_phase_at_start(fixed.deg2rad(f(315,1))),

	CustomSystemBody:new('Himalia', 'PLANET_ASTEROID')
		:seed(891311291)
		:radius(f(1334,100000))
		:mass(f(1122,1000000000)) -- 670e16 kg, 1.122e-6 EM
		:temp(124)
		:semi_major_axis(f(766,10000))
		:eccentricity(f(16,100))
		:inclination(math.deg2rad(29.59))
		:rotation_period(f(12982,100))
		:metallicity(f(22,1000))
		:volcanicity(f(1,1))
		:orbital_phase_at_start(fixed.deg2rad(f(105,1))),

	CustomSystemBody:new('Lysithea', 'PLANET_ASTEROID')
		:seed(112519920851)
		:radius(f(282,100000))
		:mass(f(1055,100000000000)) -- 6.3e16 kg, 1.055e-8 EM
		:temp(124)
		:semi_major_axis(f(783,10000))
		:eccentricity(f(11,100))
		:inclination(math.deg2rad(25.77))
		:rotation_period(f(1292,100))
		:metallicity(f(2,1000))
		:volcanicity(f(0,1))
		:orbital_phase_at_start(fixed.deg2rad(f(12,1))),

	CustomSystemBody:new('Elara', 'PLANET_ASTEROID')
		:seed(5121181)
		:radius(f(675,100000))
		:mass(f(1457,10000000000)) -- 87e16 kg, 1.457e-7 EM
		:temp(124)
		:semi_major_axis(f(781,10000))
		:eccentricity(f(22,100))
		:inclination(math.deg2rad(30.66))
		:rotation_period(f(5,10))
		:metallicity(f(8,1000))
		:volcanicity(f(0,1))
		:orbital_phase_at_start(fixed.deg2rad(f(92,1))),

	CustomSystemBody:new('Aega', 'PLANET_ASTEROID')
		:seed(1571)
		:radius(f(313,1000000))
		:mass(f(1055,100000000000))
		:temp(113)
		:semi_major_axis(f(808,10000))
		:eccentricity(f(21,100))
		:inclination(math.deg2rad(28.2))
		:rotation_period(f(8,10))
		:metallicity(f(8,1000))
		:volcanicity(f(0,1))
		:orbital_phase_at_start(fixed.deg2rad(f(193,1))),

}

local sn55 = CustomSystemBody:new('1995 SN55', 'PLANET_TERRESTRIAL')
	:seed(191455)
	:radius(f(00344927064,1000000000)) -- 16.84km mean
	:mass(f(112,100000000000)) -- 6.687e15 kg
	:temp(74)
	:semi_major_axis(f(15882,1000)) -- 15.882 AU
	:eccentricity(f(16333,100000)) -- 0.16333
	:inclination(math.deg2rad(4.14)) -- 4.14°
	:rotation_period(f(100317365130,1000000)) -- 100317 days
	:orbital_phase_at_start(fixed.deg2rad(f(230,1))) -- random, to get it away from Luna
	:ice_cover(f(7,10))

	local sn55_starports = {
	CustomSystemBody:new('Snelton Observatory', 'STARPORT_SURFACE')
		:latitude(math.deg2rad(84))
		:longitude(math.deg2rad(96)),
}

local saturn = CustomSystemBody:new('Saturn', 'PLANET_GAS_GIANT')
	:seed(19120211814)
	:radius(f(9,1))
	:mass(f(95152,1000))
	:temp(134)
	:semi_major_axis(f(9582,1000))
	:eccentricity(f(557,10000))
	:inclination(math.deg2rad(2.485))
	:rotation_period(f(4,10))
	:axial_tilt(fixed.deg2rad(f(2673,100)))
	:rings(f(1298,1000), f(2383,1000), {0.435, 0.412, 0.335, 0.9})
	:orbital_phase_at_start(fixed.deg2rad(f(217,1)))

local saturn_moons = {
	CustomSystemBody:new('Ymir', 'PLANET_ASTEROID')
		:seed(25121019)
		:radius(f(12557,10000000))
		:mass(f(90278,1000000000000))
		:temp(86.9)
		:metallicity(21.8,100)
		:ice_cover(25.9,100)
		:semi_major_axis(f(1540128873,10000000000))
		:eccentricity(f(3349,10000))
		:inclination(math.deg2rad(173.125))
		:rotation_period(f(4967583333,10000000000)),
	CustomSystemBody:new('Mimas', 'PLANET_TERRESTRIAL')
		:seed(1815142519)
		:radius(f(311,10000))        -- 198 km mean radius
		:mass(f(628,100000000))      -- 3.75e19 kg
		:temp(65)
		:semi_major_axis(f(1240,1000000))  -- 185,539 km
		:eccentricity(f(196,10000))
		:inclination(math.deg2rad(1.574))
		:rotation_period(f(9424,10000))    -- 22.6 h (synchronous)
		:ice_cover(f(9,10))
		:metallicity(f(1,10))
		:volcanicity(f(0,1)),

	CustomSystemBody:new('Enceladus', 'PLANET_TERRESTRIAL')
		:seed(5121513195)
		:radius(f(396,10000))        -- 252 km mean radius
		:mass(f(1809,100000000))     -- 1.08e20 kg
		:temp(75)
		:semi_major_axis(f(1590,1000000))  -- 238,020 km
		:eccentricity(f(47,10000))
		:inclination(math.deg2rad(0.009))
		:rotation_period(f(1370,1000))     -- 1.37 days (synchronous)
		:ice_cover(f(8,10))
		:ocean_cover(f(3,10))              -- confirmed subsurface ocean
		:atmos_density(f(1,1000))          -- thin water/O2 exosphere
		:atmos_oxidizing(f(1,20))
		:volcanicity(f(6,10))              -- active cryovolcanism at south pole
		:life(f(1,10)),                    -- candidate for microbial life
	{
		CustomSystemBody:new('Cassini Station', 'STARPORT_ORBITAL')
			:semi_major_axis(f(3,1000000))
			:rotation_period(f(1370,1000)),
		CustomSystemBody:new('Tiger Stripe Base', 'STARPORT_SURFACE')
			:latitude(math.deg2rad(-85))
			:longitude(math.deg2rad(0)),
	},

	CustomSystemBody:new('Tethys', 'PLANET_TERRESTRIAL')
		:seed(2052082519)
		:radius(f(083,1000))
		:mass(f(103,1000000))
		:temp(86)
		:semi_major_axis(f(002,1000))
		:eccentricity(f(0,1))
		:inclination(math.deg2rad(1.12))
		:rotation_period(f(1887,1000)),
	CustomSystemBody:new('Dione', 'PLANET_TERRESTRIAL')
		:seed(-562018355)
		:radius(f(881,10000))
		:mass(f(328,1000000))
		:temp(87)
		:metallicity(f(1,2))
		:semi_major_axis(f(252,100000))
		:eccentricity(f(22,10000))
		:inclination(math.deg2rad(0.019))
		:rotation_period(f(2737,1000)),
	CustomSystemBody:new('Rhea', 'PLANET_TERRESTRIAL')
		:seed(18851)
		:radius(f(12,100))
		:mass(f(406,100000000))
		:semi_major_axis(f(352,100000))
		:rotation_period(f(452,100))
		:temp(81)
		:eccentricity(f(126,100000))
		:inclination(math.deg2rad(0.345))
		:atmos_density(f(82,1000)),
		{
			CustomSystemBody:new('Maneo Landing', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(14.000))
				:longitude(math.deg2rad(-303.2)),
		},
	CustomSystemBody:new('Titan', 'PLANET_TERRESTRIAL')
		:seed(21921114)
		:radius(f(400,1000))
		:mass(f(225,10000))
		:temp(94)
		:semi_major_axis(f(82,10000))
		:eccentricity(f(288,10000))
		:inclination(math.deg2rad(0.34854))
		:atmos_density(f(122,10))
		:atmos_oxidizing(f(6,10))
		:rotation_period(f(15945,1000)),
	{
		CustomSystemBody:new('Oasis City', 'STARPORT_SURFACE')
			:latitude(math.deg2rad(-65.4))
			:longitude(math.deg2rad(83)),
		CustomSystemBody:new('Port Makenzie', 'STARPORT_SURFACE')
			:latitude(math.deg2rad(31))
			:longitude(math.deg2rad(121)),
		CustomSystemBody:new('Daniel\'s Haven', 'STARPORT_ORBITAL')
			:semi_major_axis(f(12,500000))
			:eccentricity(f(50,1000))
			:rotation_period(f(11,9)),
	},
	CustomSystemBody:new('Iapetus', 'PLANET_TERRESTRIAL')
		:seed(-644022643)
		:radius(f(1155,10000))
		:mass(f(3,10000))
		:temp(115)
		:metallicity(f(4,5))
		:semi_major_axis(f(238,10000))
		:eccentricity(f(29,1000))
		:inclination(math.deg2rad(15.47))
		:rotation_period(f(7932,100)),
	CustomSystemBody:new('Phoebe', 'PLANET_TERRESTRIAL')
		:seed(1740171277)
		:radius(f(17,1000))
		:mass(f(139,100000000))
		:temp(115)
		:semi_major_axis(f(87,1000))
		:eccentricity(f(156,1000))
		:inclination(math.deg2rad(151.78))
		:rotation_period(f(386,1000)),
		{
			CustomSystemBody:new('Phoebe Research Centre', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(14.000))
				:longitude(math.deg2rad(-303.2)),
		},
	CustomSystemBody:new('Hyperion', 'PLANET_ASTEROID')
		:seed(825165101615)
		:radius(f(2681,100000))
		:mass(f(77548,1000000000))
		:temp(83.4)
		:semi_major_axis(f(98999337,10000000000))
		:eccentricity(f(1230061,10000000))
		:inclination(math.deg2rad(0.43))
		:rotation_period(f(130,10)),
		{
			CustomSystemBody:new('Hyperion Cantos', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(14.000))
				:longitude(math.deg2rad(-303.2)),
		},
	CustomSystemBody:new('Janus', 'PLANET_ASTEROID')
		:seed(825165101615)
		:radius(f(12475,1000000))
		:mass(f(25849,1000000000))
		:temp(70.58)
		:metallicity(f(43.7,100))
		:ice_cover(26,100)
		:semi_major_axis(f(10162673,10000000000))
		:eccentricity(f(68,10000))
		:inclination(math.deg2rad(0.163))
		:rotation_period(f(4,10)),
		{
			CustomSystemBody:new('Janus Dome', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(14.000))
				:longitude(math.deg2rad(-303.2)),
		},

	-- Epimetheus: co-orbital with Janus, they swap orbits every ~4 years
	CustomSystemBody:new('Epimetheus', 'PLANET_ASTEROID')
		:seed(5192019121518)
		:radius(f(912,100000))       -- 58 km mean radius
		:mass(f(88,1000000000))      -- 5.26e17 kg
		:temp(78)
		:semi_major_axis(f(10120,10000000))  -- 151,410 km (just inside Janus)
		:eccentricity(f(98,10000))
		:inclination(math.deg2rad(0.351))
		:rotation_period(f(6942,10000))     -- 16.7 h (synchronous)
		:metallicity(f(4,10))
		:ice_cover(f(6,10))
		:orbital_phase_at_start(fixed.deg2rad(f(180,1))),

}

local chariklo = CustomSystemBody:new('Chariklo', 'PLANET_TERRESTRIAL')
	:seed(381189111215)
	:radius(f(00464083686,1000000000)) -- 16.84km mean
	:mass(f(112,100000000000)) -- 6.687e15 kg
	:temp(90)
	:semi_major_axis(f(15882,1000)) -- 15.882 AU
	:eccentricity(f(1721,10000)) -- 0.223
	:inclination(math.deg2rad(23.382)) -- 10.829°
	:rotation_period(f(291833333,1000000000)) -- 7 hours
	:orbital_phase_at_start(fixed.deg2rad(f(230,1))) -- random, to get it away from Luna

	local chariklo_starports = {
	CustomSystemBody:new('Chariklo Outpost', 'STARPORT_SURFACE')
		:latitude(math.deg2rad(84))
		:longitude(math.deg2rad(96)),
}

local uranus = CustomSystemBody:new('Uranus', 'PLANET_GAS_GIANT')
	:seed(21181142119)
	:radius(f(4,1))
	:mass(f(145,10))
	:temp(76)
	:semi_major_axis(f(19229,1000))
	:eccentricity(f(444,10000))
	:inclination(math.deg2rad(0.772))
	:rotation_period(f(7,10))
	:axial_tilt(fixed.deg2rad(f(9777,100)))
	:rings(f(17528,10000), f(2,1), {0.51, 0.48, 0.384, 0.8})
	:orbital_phase_at_start(fixed.deg2rad(f(245,1)))

local uranus_moons = {
	-- Miranda: innermost major moon, most dramatic terrain in the solar system
	-- Verona Rupes: a cliff ~20 km high, tallest known in the solar system
	CustomSystemBody:new('Miranda', 'PLANET_TERRESTRIAL')
		:seed(13215198512)
		:radius(f(370,10000))        -- 235.8 km mean radius
		:mass(f(1072,100000000))     -- 6.4e19 kg
		:temp(60)
		:semi_major_axis(f(865,1000000))   -- 129,390 km
		:eccentricity(f(13,10000))
		:inclination(math.deg2rad(4.338))
		:rotation_period(f(1413,1000))     -- 1.413 days (synchronous)
		:axial_tilt(fixed.deg2rad(f(0,1)))
		:ice_cover(f(6,10))
		:metallicity(f(3,10))
		:volcanicity(f(0,1)),
	{
		CustomSystemBody:new('Verona Station', 'STARPORT_ORBITAL')
			:semi_major_axis(f(3,1000000))
			:rotation_period(f(1413,1000)),
		CustomSystemBody:new('Arden Base', 'STARPORT_SURFACE')
			:latitude(math.deg2rad(-20))
			:longitude(math.deg2rad(140)),
	},

	CustomSystemBody:new('Ariel', 'PLANET_TERRESTRIAL')
		:seed(1189512)
		:radius(f(908,10000))
		:mass(f(226,1000000))
		:temp(60)
		:semi_major_axis(f(1277,1000000))
		:eccentricity(f(12,10000))
		:inclination(math.deg2rad(0.26))
		:rotation_period(f(252,100)),
	CustomSystemBody:new('Umbriel', 'PLANET_TERRESTRIAL')
		:seed(21132189512) 
		:radius(f(92,1000))
		:mass(f(2,10000))
		:temp(75)
		:semi_major_axis(f(178,100000))
		:eccentricity(f(39,10000))
		:inclination(math.deg2rad(0.128))
		:rotation_period(f(4144,1000)),
	CustomSystemBody:new('Titania', 'PLANET_TERRESTRIAL')
		:seed(2192111491) 
		:radius(f(1235,10000))
		:mass(f(5908,10000000))
		:temp(70)
		:semi_major_axis(f(2913,1000000))
		:eccentricity(f(11,10000))
		:inclination(math.deg2rad(0.34))
		:rotation_period(f(87,10))
		:atmos_density(f(82,1000)),
		{
			CustomSystemBody:new('Weaver Science Outpost', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(14.000))
				:longitude(math.deg2rad(-303.2)),
		},
	CustomSystemBody:new('Oberon', 'PLANET_TERRESTRIAL')
		:seed(1525181514) 
		:radius(f(1194,10000))
		:mass(f(5046,10000000))
		:temp(75)
		:semi_major_axis(f(39,10000))
		:eccentricity(f(14,10000))
		:inclination(math.deg2rad(0.058))
		:rotation_period(f(135,10)),
}

local chiron = CustomSystemBody:new('Chiron', 'PLANET_ASTEROID')
	:seed(389181514)
	:radius(f(344,10000)) -- 16.84km mean
	:mass(f(112,100000000000)) -- 6.687e15 kg
	:temp(74)
	:semi_major_axis(f(15882,1000)) -- 15.882 AU
	:eccentricity(f(3823,10000)) -- 0.223
	:inclination(math.deg2rad(6.9497)) -- 10.829°
	:rotation_period(f(2194,10000)) -- 5h16m
	:orbital_phase_at_start(fixed.deg2rad(f(230,1))) -- random, to get it away from Luna
	:ice_cover(f(7,10))

	local chiron_starports = {
	CustomSystemBody:new('Chiron Outpost', 'STARPORT_SURFACE')
		:latitude(math.deg2rad(84))
		:longitude(math.deg2rad(96)),
}

local neptune = CustomSystemBody:new('Neptune', 'PLANET_GAS_GIANT')
	:seed(1365118457)
	:radius(f(38,10))
	:mass(f(17147,1000))
	:temp(72)
	:semi_major_axis(f(30104,1000))
	:eccentricity(f(112,10000))
	:inclination(math.deg2rad(1.768))
	:rotation_period(f(75,100))
	:axial_tilt(fixed.deg2rad(f(2832,100)))
	:rings(f(2195,1000), f(236,100), {0.71, 0.68, 0.684, 0.75})
	:orbital_phase_at_start(fixed.deg2rad(f(353,1)))

local neptune_moons = {
	CustomSystemBody:new('Larissa', 'PLANET_ASTEROID')
		:seed(12181919919)
		:radius(f(152,10000))        -- 97 km mean radius
		:mass(f(70,100000000))       -- 4.2e18 kg
		:temp(55)
		:semi_major_axis(f(492,1000000))   -- 73,548 km
		:eccentricity(f(14,10000))
		:inclination(math.deg2rad(0.251))
		:rotation_period(f(5549,10000))    -- 13.3 h (synchronous)
		:metallicity(f(3,10))
		:ice_cover(f(4,10)),

	CustomSystemBody:new('Proteus', 'PLANET_ASTEROID')
		:seed(1251043226)
		:metallicity(f(7,10))
		:radius(f(310,10000))
		:mass(f(843,100000000)) -- 5035e16 kg, 8.43e-6 EM
		:temp(51)
		:semi_major_axis(f(786,1000000))
		:eccentricity(f(53,100000))
		:inclination(math.deg2rad(0.524))
		:rotation_period(f(1122,1000)),
	CustomSystemBody:new('Triton', 'PLANET_TERRESTRIAL')
		:seed(21189211514) 
		:radius(f(2122,10000))
		:mass(f(359,100000))
		:temp(38)
		:semi_major_axis(f(2371,100000))
		:eccentricity(f(16,1000000))
		:volcanicity(f(3,10)) -- Cryovolcanos!
		:inclination(math.deg2rad(156.885))
		:rotation_period(f(141,24))
		:atmos_density(f(100,1225))
		:atmos_oxidizing(f(1,20)),
	{
		CustomSystemBody:new('Poseidon Station', 'STARPORT_ORBITAL')
			:semi_major_axis(f(12,500000))
			:rotation_period(f(11,7)),
	},
	CustomSystemBody:new('Nereid', 'PLANET_ASTEROID')
		:seed(14518594) 
		:radius(f(2668,100000))
		:mass(f(452,100000000)) -- 2700e16 kg, 4.52e-6 EM
		:temp(50)
		:semi_major_axis(f(3685,100000))
		:eccentricity(f(75,100))
		:inclination(math.deg2rad(32.55))
		:rotation_period(f(115,240)),
}

local nessus = CustomSystemBody:new('Nessus', 'PLANET_TERRESTRIAL')
	:seed(14519192219)
	:radius(f(00094071017,1000000000)) -- 16.84km mean
	:mass(f(112,100000000000)) -- 6.687e15 kg
	:temp(72)
	:semi_major_axis(f(24639,1000)) -- 24.639 AU
	:eccentricity(f(5189,10000)) -- 0.223
	:inclination(math.deg2rad(15.663)) -- 10.829°
	:rotation_period(f(4444444444,100000)) -- 44,444 days
	:metallicity(f(7,10))
	:orbital_phase_at_start(fixed.deg2rad(f(230,1))) -- random, to get it away from Luna

	local nessus_starports = {
	CustomSystemBody:new('Artifact\'s Edge', 'STARPORT_SURFACE')
		:latitude(math.deg2rad(84))
		:longitude(math.deg2rad(96)),
}

local pluto = CustomSystemBody:new('Pluto', 'PLANET_TERRESTRIAL')
	:seed(1612222115) 
	:radius(f(186,1000))
	:mass(f(21,10000))
	:temp(44)
	:atmos_oxidizing(f(0.00001,1))
	:semi_major_axis(f(394,10))
	:eccentricity(f(2488,10000))
	:inclination(math.deg2rad(11.88))
	:rotation_period(f(638680,100000))
	:axial_tilt(fixed.deg2rad(f(296,10)))
	:ice_cover(f(7,10))
	:orbital_phase_at_start(fixed.deg2rad(f(315,1)))

local pluto_starports = {
	CustomSystemBody:new('Pluto Research Base', 'STARPORT_SURFACE')
		:latitude(math.deg2rad(84))
		:longitude(math.deg2rad(96)),
}

local charon = {

	CustomSystemBody:new('Charon', 'PLANET_TERRESTRIAL')
		:seed(381181514) 
		:radius(f(951,10000))
		:mass(f(2,10000))
		:temp(44)
		:semi_major_axis(f(117,1000000))
		:eccentricity(f(220,10000))
		:inclination(math.deg2rad(119.5))
		:axial_tilt(fixed.deg2rad(f(668,100)))
		:volcanicity(f(0,1))
		:rotation_period(f(638680,100000))
}

local makemake = CustomSystemBody:new('Makemake', 'PLANET_TERRESTRIAL')
	:seed(131115131115) 
	:radius(f(115, 1000))
	:mass(f(16, 100000))
	:temp(44)
	:semi_major_axis(f(45561,1000))
	:eccentricity(f(15804,100000))
	:inclination(math.deg2rad(28.98030))
	:rotation_period(f(9511083333,10000000000))
	:axial_tilt(fixed.deg2rad(f(296,10)))
	:orbital_phase_at_start(fixed.deg2rad(f(323,1)))
	
local mk2 = {

	CustomSystemBody:new('MK2', 'PLANET_TERRESTRIAL')
		:seed(13112) 
		:radius(f(13, 1000))
		:mass(f(1, 100000))
		:temp(44)
		:semi_major_axis(f(1403763,10000000000))
		:eccentricity(f(220,10000))
		:inclination(math.deg2rad(28.98030))
		:rotation_period(f(124,10))
		:axial_tilt(fixed.deg2rad(f(668,100)))
}

local makemake_starports = {
			CustomSystemBody:new('Moai Landing', 'STARPORT_SURFACE')
					:latitude(math.deg2rad(14.000))
					:longitude(math.deg2rad(-303.2)),
			CustomSystemBody:new('Ahu Tongariki', 'STARPORT_ORBITAL')
				:semi_major_axis(f(42,10000))
				:rotation_period(f(1,1)),
}

local haumea = CustomSystemBody:new('Haumea', 'PLANET_TERRESTRIAL')
	:seed(81211351) 
	:radius(f(125, 1000))
	:mass(f(66, 100000))
	:temp(41)
	:semi_major_axis(f(43152,100))
	:eccentricity(f(19489,100000))
	:inclination(math.deg2rad(28.214))
	:rotation_period(f(163139208,1000000000))
	:axial_tilt(fixed.deg2rad(f(296,10)))
	:ice_cover(f(3,10))
	:metallicity(f(1,50))
	:orbital_phase_at_start(fixed.deg2rad(f(323,1)))

local haumea_starports = {
			CustomSystemBody:new('Pele Landing', 'STARPORT_SURFACE')
					:latitude(math.deg2rad(90))
					:longitude(math.deg2rad(0)),
			CustomSystemBody:new('Kapo Base', 'STARPORT_SURFACE')
					:latitude(math.deg2rad(-90))
					:longitude(math.deg2rad(0)),
			CustomSystemBody:new('Kauakahi Port', 'STARPORT_ORBITAL')
				:semi_major_axis(f(401,1000000))
				:inclination(math.deg2rad(119))
				:rotation_period(f(1,1)),

}

local hiiaka = {

	CustomSystemBody:new('Hi\'aka', 'PLANET_ASTEROID')
		:seed(8991111) 
		:radius(f(251, 10000))
		:mass(f(33, 100000))
		:temp(41)
		:semi_major_axis(f(333,1000000))
		:eccentricity(f(513,10000))
		:inclination(math.deg2rad(126.356))
		:rotation_period(f(408333,1000000))
		:metallicity(f(1,100))
		:orbital_phase_at_start(fixed.deg2rad(f(323,1)))
}

local hiiaka_starports = {

			CustomSystemBody:new('Kaha\'ula City', 'STARPORT_SURFACE')
					:latitude(math.deg2rad(0))
					:longitude(math.deg2rad(-170)),

}

local namaka =	{

	CustomSystemBody:new('Namaka', 'PLANET_ASTEROID')
		:seed(141131111) 
		:radius(f(125, 10000))
		:mass(f(1, 100000))
		:temp(41)
		:semi_major_axis(f(171,1000000))
		:eccentricity(f(249,1000))
		:inclination(math.deg2rad(113.013))
		:rotation_period(f(182783,10000))
		:metallicity(f(1,100))
		:orbital_phase_at_start(fixed.deg2rad(f(37,1)))
}

local namaka_starports = {

			CustomSystemBody:new('Laumiha Colony', 'STARPORT_SURFACE')
					:latitude(math.deg2rad(0))
					:longitude(math.deg2rad(-170)),

}

local gonggong = CustomSystemBody:new('Gonggong', 'PLANET_TERRESTRIAL')
	:seed(715147715147) 
	:radius(f(965, 10000))
	:mass(f(66, 100000))
	:temp(12)
	:semi_major_axis(f(67471,100))
	:eccentricity(f(50048,100000))
	:inclination(math.deg2rad(30.6569))
	:rotation_period(f(202468313708,1000000))
	:ice_cover(f(1,10))
	:metallicity(f(1,100))
	:orbital_phase_at_start(fixed.deg2rad(f(323,1)))

local gonggong_starports = {
			CustomSystemBody:new('Gonggong Base', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(62.2426))
				:longitude(math.deg2rad(-25.7473)),

			CustomSystemBody:new('Villi Port', 'STARPORT_ORBITAL')
				:semi_major_axis(f(200,1000000))
				:inclination(math.deg2rad(50))
				:rotation_period(f(1,1)),
}

local xiangliu = {
	CustomSystemBody:new('Xiangliu', 'PLANET_ASTEROID')
		:seed(249114712921) 
		:radius(f(941, 100000))
		:mass(f(33, 100000))
		:temp(12)
		:semi_major_axis(f(16,100000))
		:eccentricity(f(2908,10000))
		:inclination(math.deg2rad(83.08))
		:rotation_period(f(2522,100))
		:metallicity(f(1,100))
		:orbital_phase_at_start(fixed.deg2rad(f(323,1)))
}

local xiangliu_starports = {
			CustomSystemBody:new('Xiangliu Base', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(0))
				:longitude(math.deg2rad(-25.7473)),

}

local quaoar = CustomSystemBody:new('Quaoar', 'PLANET_TERRESTRIAL')
	:seed(1721115118) 
	:radius(f(879, 10000))
	:mass(f(66, 100000))
	:temp(44)
	:semi_major_axis(f(43694,1000))
	:eccentricity(f(4106,100000))
	:inclination(math.deg2rad(7.9895))
	:rotation_period(f(368308333,1000000000))
	:ice_cover(f(3,10))
	:metallicity(f(1,100))
	:orbital_phase_at_start(fixed.deg2rad(f(323,1)))

local quaoar_starports = {

			CustomSystemBody:new('Out Nowhere', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(62.2426))
				:longitude(math.deg2rad(-25.7473)),
			CustomSystemBody:new('Chingichngish', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(-62.2426))
				:longitude(math.deg2rad(25.7473)),

			CustomSystemBody:new('Wiyot Port', 'STARPORT_ORBITAL')
				:semi_major_axis(f(200,1000000))
				:inclination(math.deg2rad(50))
				:rotation_period(f(1,1)),

}

local weywot = {
	CustomSystemBody:new('Weywot', 'PLANET_ASTEROID')
		:seed(23525) 
		:radius(f(133, 10000))
		:mass(f(11, 1000000))
		:temp(44)
		:semi_major_axis(f(96,1000000))
		:eccentricity(f(406,1000))
		:inclination(math.deg2rad(14))
		:rotation_period(f(12438,1000))
		:metallicity(f(1,100))
		:orbital_phase_at_start(fixed.deg2rad(f(323,1)))
}

local weywot_starports = {
			CustomSystemBody:new('Weywot Base', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(0))
				:longitude(math.deg2rad(0)),
}

local orcus = CustomSystemBody:new('Orcus', 'PLANET_TERRESTRIAL')
	:seed(151832119) 
	:radius(f(143, 1000))
	:mass(f(66, 100000))
	:temp(44)
	:semi_major_axis(f(39174,1000))
	:eccentricity(f(22701,100000))
	:inclination(math.deg2rad(20.592))
	:rotation_period(f(8955223880,100000))
	:ice_cover(f(3,10))
	:metallicity(f(1,100))
	:volcanicity(f(1,10))
	:orbital_phase_at_start(fixed.deg2rad(f(323,1)))

local orcus_starports = {
			CustomSystemBody:new('Palatine City', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(41.8894))
				:longitude(math.deg2rad(-12.4875)),

			CustomSystemBody:new('Charun Habitat', 'STARPORT_ORBITAL')
				:semi_major_axis(f(200,1000000))
				:inclination(math.deg2rad(60))
				:rotation_period(f(1,1)),
}

local vanth = {
	CustomSystemBody:new('Vanth', 'PLANET_ASTEROID')
		:seed(21114208) 
		:radius(f(372, 1000000))
		:mass(f(11, 100000))
		:temp(44)
		:semi_major_axis(f(601,10000000))
		:eccentricity(f(00091,100000))
		:inclination(math.deg2rad(105.03))
		:metallicity(f(1,100))
		:orbital_phase_at_start(fixed.deg2rad(f(323,1)))
		:rotation_period(f(8955223880,100000))
}

local vanth_starports = {
			CustomSystemBody:new('New Chiusi', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(41.8894))
				:longitude(math.deg2rad(-12.4875)),

}

local salacia = CustomSystemBody:new('Salacia', 'PLANET_TERRESTRIAL')
	:seed(191121391) 
	:radius(f(670, 10000))
	:mass(f(66, 100000))
	:temp(40)
	:semi_major_axis(f(42184,1000))
	:eccentricity(f(10636,100000))
	:inclination(math.deg2rad(23.921))
	:rotation_period(f(254,1000))
	:ice_cover(f(9,10))
	:metallicity(f(1,100))
	:volcanicity(f(0,10))
	:orbital_phase_at_start(fixed.deg2rad(f(323,1)))

local salacia_starports = {

			CustomSystemBody:new('Mineral Research Base', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(-49.3496))
				:longitude(math.deg2rad(-70.2180)),
			CustomSystemBody:new('Salacia Colony', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(78.2232))
				:longitude(math.deg2rad(-15.6267)),

			CustomSystemBody:new('Qesakoloniya', 'STARPORT_ORBITAL')
				:semi_major_axis(f(764,10000000))
				:inclination(math.deg2rad(23.59))
				:rotation_period(f(1,1)),

}

local actaea = {
	CustomSystemBody:new('Actaea', 'PLANET_ASTEROID')
		:seed(1320151) 
		:radius(f(22, 1000))
		:mass(f(11, 100000))
		:temp(40)
		:semi_major_axis(f(382,10000000))
		:eccentricity(f(98,10000))
		:inclination(math.deg2rad(23.59))
		:rotation_period(f(5493882,1000000))
		:ice_cover(f(9,10))
		:metallicity(f(1,100))
		:volcanicity(f(0,10))
		:orbital_phase_at_start(fixed.deg2rad(f(323,1)))
}

	local actaea_starports = {

			CustomSystemBody:new('Nereid Outlook', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(-49.3496))
				:longitude(math.deg2rad(-70.2180)),

	}

local MS4 = CustomSystemBody:new('2002 MS4', 'PLANET_TERRESTRIAL')
	:seed(2002134) 
	:radius(f(612, 10000))
	:mass(f(66, 100000))
	:temp(40)
	:semi_major_axis(f(42184,1000))
	:eccentricity(f(13936,100000))
	:inclination(math.deg2rad(17.683))
	:rotation_period(f(435,1000))
	:ice_cover(f(9,10))
	:metallicity(f(1,100))
	:volcanicity(f(0,10))
	:orbital_phase_at_start(fixed.deg2rad(f(323,1)))

local MS4_starports = {

			CustomSystemBody:new('New Longyearbyen', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(-49.3496))
				:longitude(math.deg2rad(-70.2180)),

			CustomSystemBody:new('Trondheim II', 'STARPORT_ORBITAL')
				:semi_major_axis(f(764,10000000))
				:rotation_period(f(1,1)),

	}



local sedna = CustomSystemBody:new('Sedna', 'PLANET_TERRESTRIAL')
	:seed(1954141)
	:radius(f(769,10000))        -- ~490 km radius (corrected)
	:mass(f(1.635, 1000))
	:temp(12)
	:semi_major_axis(f(506,1))
	:eccentricity(f(85491,100000))
	:inclination(math.deg2rad(11.92872))
	:rotation_period(f(428041667,1000000000))
	:axial_tilt(fixed.deg2rad(f(296,10)))
	:ice_cover(f(7,10))
	:orbital_phase_at_start(fixed.deg2rad(f(323,1)))
	
local sedna_starports = {
			CustomSystemBody:new('Farpoint Base', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(14.000))
				:longitude(math.deg2rad(-303.2)),
			CustomSystemBody:new('Rleyh Outpost', 'STARPORT_ORBITAL')
				:semi_major_axis(f(5068,100000000))
				:rotation_period(f(11,24)),
}

local eris = CustomSystemBody:new('Eris', 'PLANET_TERRESTRIAL')
	:seed(58919)
	:radius(f(1825,10000))       -- ~1163 km radius (corrected, no float in f())
	:mass(f(2.8, 1000))
	:temp(12)
	:semi_major_axis(f(67864, 1000))
	:eccentricity(f(43838,100000))
	:inclination(math.deg2rad(44.1444))
	:rotation_period(f(25.9,24))
	:axial_tilt(fixed.deg2rad(f(136,10)))
	:orbital_phase_at_start(fixed.deg2rad(f(323,1)))
	
local eris_starports = {
			CustomSystemBody:new('Barbary Landing', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(14.000))
				:longitude(math.deg2rad(-303.2)),
			CustomSystemBody:new('Barbarosa Hideout', 'STARPORT_ORBITAL')
				:semi_major_axis(f(5068,100000000))
				:rotation_period(f(11,24)),
}

local dysnomia = {

	CustomSystemBody:new('Dysnomia', 'PLANET_TERRESTRIAL')
		:seed(4251914151391) 
		:radius(f(5.48747601, 100))
		:mass(f(7.36726, 100000))
		:temp(12)
		:semi_major_axis(f(37350,100000000))
		:eccentricity(f(1.3,100))
		:inclination(math.deg2rad(61.3))
		:rotation_period(f(1578589,100000))
		:axial_tilt(fixed.deg2rad(f(668,100)))
}

local farfarout = CustomSystemBody:new('FarFarOut', 'PLANET_TERRESTRIAL')
		:seed(61186118152120)
		:radius(f(49701,10000000))
		:mass(f(1400,1000000))       -- corrected: no float in f()
		:temp(12)
		:semi_major_axis(f(175,1))   -- ~175 AU (corrected from 80 AU)
		:eccentricity(f(655,1000))
		:inclination(math.deg2rad(18.68))
		:rotation_period(f(261871.127398,100000))
		:axial_tilt(fixed.deg2rad(f(319,10)))


local farfarout_starports = {
			CustomSystemBody:new('Out Woop Woop', 'STARPORT_SURFACE')
				:latitude(math.deg2rad(14.000))
				:longitude(math.deg2rad(-303.2)),
			CustomSystemBody:new('FarAway Station', 'STARPORT_ORBITAL')
				:semi_major_axis(f(5068,100000000))
				:rotation_period(f(11,24)),
}

-- ============================================================
-- JUPITER TROJANS (L4 Greek camp ~60° ahead, L5 Trojan camp ~60° behind)
-- ============================================================

local hektor = CustomSystemBody:new('624 Hektor', 'PLANET_ASTEROID')
	:seed(6241518211518)
	:radius(f(319,10000))        -- ~203 km mean radius, largest L4 Trojan
	:mass(f(184,100000000))      -- ~1.1e19 kg
	:temp(170)
	:semi_major_axis(f(5238,1000))
	:eccentricity(f(246,10000))
	:inclination(math.deg2rad(18.18))
	:rotation_period(f(2884,10000))    -- 6.92 h
	:axial_tilt(fixed.deg2rad(f(0,1)))
	:metallicity(f(2,10))
	:orbital_phase_at_start(fixed.deg2rad(f(135,1)))  -- L4 point

local hektor_starports = {
	CustomSystemBody:new('Hektor Waystation', 'STARPORT_SURFACE')
		:latitude(math.deg2rad(12))
		:longitude(math.deg2rad(45)),
	CustomSystemBody:new('Hektor Orbital', 'STARPORT_ORBITAL')
		:semi_major_axis(f(3,1000000))
		:rotation_period(f(1,1)),
}

local achilles = CustomSystemBody:new('588 Achilles', 'PLANET_ASTEROID')
	:seed(5882021899)
	:radius(f(1060,100000))      -- ~67.5 km radius, first Trojan discovered
	:mass(f(234,10000000000))    -- ~1.4e17 kg
	:temp(165)
	:semi_major_axis(f(5184,1000))
	:eccentricity(f(148,1000))
	:inclination(math.deg2rad(10.33))
	:rotation_period(f(3042,10000))    -- 7.3 h
	:metallicity(f(2,10))
	:orbital_phase_at_start(fixed.deg2rad(f(148,1)))  -- L4 camp

local achilles_starports = {
	CustomSystemBody:new('Achilles Outpost', 'STARPORT_SURFACE')
		:latitude(math.deg2rad(30))
		:longitude(math.deg2rad(-120)),
}

local patroclus = CustomSystemBody:new('617 Patroclus', 'PLANET_ASTEROID')
	:seed(6172019181521)
	:radius(f(1774,100000))      -- ~113 km, L5 binary system
	:mass(f(228,1000000000))     -- ~1.36e18 kg
	:temp(165)
	:semi_major_axis(f(5209,1000))
	:eccentricity(f(140,1000))
	:inclination(math.deg2rad(22.04))
	:rotation_period(f(4283,1000))     -- 102.8 h, slow rotator
	:metallicity(f(2,10))
	:orbital_phase_at_start(fixed.deg2rad(f(15,1)))  -- L5 point

local patroclus_starports = {
	CustomSystemBody:new('Patroclus Mining Camp', 'STARPORT_SURFACE')
		:latitude(math.deg2rad(-20))
		:longitude(math.deg2rad(75)),
}

-- ============================================================
-- CLASSICAL KUIPER BELT / SCATTERED DISC OBJECTS (additions)
-- ============================================================

local ixion = CustomSystemBody:new('Ixion', 'PLANET_TERRESTRIAL')
	:seed(289782019)
	:radius(f(484,10000))        -- ~308 km radius, Plutino (3:2 resonance with Neptune)
	:mass(f(38,1000000))         -- ~2.3e20 kg
	:temp(43)
	:semi_major_axis(f(3964,100))    -- 39.64 AU
	:eccentricity(f(242,1000))
	:inclination(math.deg2rad(19.58))
	:rotation_period(f(5167,10000))  -- 12.4 h
	:ice_cover(f(5,10))
	:metallicity(f(3,10))
	:orbital_phase_at_start(fixed.deg2rad(f(100,1)))

local ixion_starports = {
	CustomSystemBody:new('Ixion Post', 'STARPORT_SURFACE')
		:latitude(math.deg2rad(-10))
		:longitude(math.deg2rad(60)),
}

local varuna = CustomSystemBody:new('Varuna', 'PLANET_TERRESTRIAL')
	:seed(200002119)
	:radius(f(532,10000))        -- ~339 km radius, rapid rotator
	:mass(f(47,1000000))         -- ~2.8e20 kg
	:temp(43)
	:semi_major_axis(f(4313,100))    -- 43.13 AU
	:eccentricity(f(58,1000))
	:inclination(math.deg2rad(17.2))
	:rotation_period(f(2643,10000))  -- 6.34 h (very fast, may have ring)
	:ice_cover(f(6,10))
	:metallicity(f(3,10))
	:orbital_phase_at_start(fixed.deg2rad(f(200,1)))

local varuna_starports = {
	CustomSystemBody:new('Varuna Relay', 'STARPORT_SURFACE')
		:latitude(math.deg2rad(35))
		:longitude(math.deg2rad(-160)),
}

-- Arrokoth: contact binary, target of New Horizons flyby Jan 2019
-- Two lobes: Arrokoth (large) and Wenu (small), fused together
local arrokoth = CustomSystemBody:new('Arrokoth', 'PLANET_ASTEROID')
	:seed(4869582019)
	:radius(f(2668,1000000))     -- ~17 km mean radius, contact binary
	:mass(f(126,100000000000))   -- ~7.5e14 kg
	:temp(44)
	:semi_major_axis(f(4458,100))    -- 44.58 AU
	:eccentricity(f(37,1000))
	:inclination(math.deg2rad(2.45))
	:rotation_period(f(6625,10000))  -- 15.9 h
	:ice_cover(f(8,10))
	:metallicity(f(1,10))
	:orbital_phase_at_start(fixed.deg2rad(f(55,1)))

local arrokoth_starports = {
	CustomSystemBody:new('New Horizons Memorial', 'STARPORT_SURFACE')
		:latitude(math.deg2rad(0))
		:longitude(math.deg2rad(0)),
}

s:bodies(sol, {
	heliosStation,
	mercury,
		mercury_starports,
	hephaistos,
		hephaistos_starports,
	sisyphus,
		sisyphus_starports,
	pheathon,
	JM8,
		JM8_starports,
	venus,
		venus_starports,
	earth,
		earth_groundbases_BDS,
		earthOrbit_starports,
		luna,
	fortuna,
	mars,
		mars_starports,
		mars_moons,
	eros,
		eros_starports,
	pallas,
		pallas_starports,
	vesta,
		vesta_starports,
	hygiea,
		hygiea_starports,
	ceres,
		ceres_starports,
	psyche,
		psyche_starports,
	tyche,
		tyche_starports,
	tycho,
		tycho_starports,
	anubis,
		anubis_starports,
	pemba,
		pemba_starports,
	tito,
		tito_starports,
	mavis,
		mavis_starports,
	boznemcova,
		boznemcova_starports,
	jupiter,
		jupiter_moons,
	hektor,
		hektor_starports,
	achilles,
		achilles_starports,
	patroclus,
		patroclus_starports,
	sn55,
		sn55_starports,
	saturn,
		saturn_moons,
	chariklo,
		chariklo_starports,
	uranus,
		uranus_moons,
	chiron,
		chiron_starports,
	neptune,
		neptune_moons,
	nessus,
		nessus_starports,
	pluto,
		pluto_starports,
		charon,
	ixion,
		ixion_starports,
	makemake,
		mk2,
		makemake_starports,
	haumea,
		haumea_starports,
		hiiaka,
			hiiaka_starports,
		namaka,
			namaka_starports,
	gonggong,
		gonggong_starports,
		xiangliu,
			xiangliu_starports,
	varuna,
		varuna_starports,
	quaoar,
		quaoar_starports,
		weywot,
			weywot_starports,
	arrokoth,
		arrokoth_starports,
	orcus,
		orcus_starports,
		vanth,
			vanth_starports,
	salacia,
		salacia_starports,
		actaea,
			actaea_starports,
	MS4,
		MS4_starports,
	sedna,
		sedna_starports,
	eris,
		eris_starports,
		dysnomia,
	farfarout,
		farfarout_starports
})


s:add_to_sector(0,0,0,v(0.001,0.001,0.001))
