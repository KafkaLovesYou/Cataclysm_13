//Fallout 13 specific areas directory

/area
	var/open_space = 0
	var/list/ambientmusic = list('sound/misc/null.ogg')
	ambience = list('sound/f13ambience/wasteland.ogg')
	var/list/ambientsounds = list()
	var/environment = -1

/area/f13
	name = "error"
	icon_state = ""
	icon = 'icons/fallout/turfs/areas.dmi'
	has_gravity = 1

//Wasteland generic areas

//Ambigen sound tips for ambientsounds: 1 - 2 : outside the ruined buildings, 3 - 9 : inside the wasteland buildings, 10 - 14 : vaults and bunkers specific, 15-17 : caves

/area/f13/wasteland
	name = "Wasteland"
	icon_state = "wasteland"
	ambience = list('sound/f13ambience/wasteland.ogg')
	ambientmusic = list('sound/f13music/fo2_wasteland.ogg','sound/f13music/fo2_desert.ogg','sound/f13music/fo2_world.ogg','sound/misc/null.ogg')
	ambientsounds = list('sound/f13ambience/battle_1.ogg','sound/f13ambience/battle_2.ogg','sound/f13ambience/battle_3.ogg', \
	'sound/f13ambience/rattlesnake_1.ogg','sound/f13ambience/rattlesnake_2.ogg','sound/f13ambience/rattlesnake_3.ogg','sound/ambience/bird1.ogg','sound/ambience/seag3.ogg','sound/ambience/seag4.ogg')
	outdoors = 1
	open_space = 1
	blob_allowed = 0
	environment = 19

/area/f13/forest
	name = "Forest"
	icon_state = "forest"
	ambience = list('sound/f13ambience/wasteland.ogg')
	ambientmusic = list('sound/f13music/fo2_wasteland.ogg','sound/f13music/fo2_chapel.ogg','sound/f13music/fo2_world.ogg','sound/misc/null.ogg')
	ambientsounds = list('sound/ambience/bird1.ogg','sound/ambience/bird2.ogg','sound/ambience/bird3.ogg','sound/ambience/seag3.ogg','sound/ambience/seag4.ogg', \
	'sound/f13ambience/rattlesnake_1.ogg','sound/f13ambience/rattlesnake_2.ogg','sound/f13ambience/rattlesnake_3.ogg')
	outdoors = 1
	open_space = 1
	blob_allowed = 0
	environment = 15

/area/f13/ruins
	name = "Ruins"
	icon_state = "ruins"
	ambience = list('sound/f13ambience/wasteland.ogg')
	ambientmusic = list('sound/f13music/fo2_ruins.ogg','sound/f13music/fo2_necropolis.ogg','sound/f13music/fo2_raider.ogg','sound/misc/null.ogg')
	ambientsounds = list('sound/ambience/ambigen1.ogg','sound/ambience/ambigen2.ogg','sound/f13ambience/dog_distant_1.ogg','sound/f13ambience/dog_distant_2.ogg','sound/f13ambience/dog_distant_3.ogg', \
	'sound/f13ambience/rattlesnake_1.ogg','sound/f13ambience/rattlesnake_2.ogg','sound/f13ambience/rattlesnake_3.ogg')
	outdoors = 1
	open_space = 1
	blob_allowed = 0
	environment = 5

/area/f13/shack
	name = "Shack"
	icon_state = "shack"
	ambience = list('sound/f13ambience/shack.ogg')
	ambientmusic = list('sound/f13music/fo2_ruins.ogg','sound/f13music/fo2_city.ogg','sound/misc/null.ogg')
	ambientsounds = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg', \
	'sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg')
	environment = 2

/area/f13/building
	name = "Building"
	icon_state = "building"
	ambience = list('sound/f13ambience/building.ogg')
	ambientmusic = list('sound/f13music/fo2_tunnels.ogg','sound/f13music/fo2_ruins.ogg','sound/misc/null.ogg')
	ambientsounds = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg', \
	'sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg')
	environment = 2

/area/f13/farm
	name = "Farm"
	icon_state = "farm"
	ambience = list('sound/f13ambience/wasteland.ogg')
	ambientmusic = list('sound/f13music/fo2_village.ogg','sound/f13music/fo2_wasteland.ogg','sound/f13music/fo2_chapel.ogg','sound/misc/null.ogg')
	ambientsounds = list('sound/f13ambience/dog_distant_1.ogg','sound/f13ambience/dog_distant_2.ogg','sound/f13ambience/dog_distant_3.ogg', \
	'sound/ambience/bird1.ogg','sound/ambience/bird2.ogg','sound/ambience/bird3.ogg','sound/ambience/seag3.ogg','sound/ambience/seag4.ogg')
	outdoors = 1
	open_space = 1
	blob_allowed = 0
	environment = 15

/area/f13/tribe
	name = "Tribe"
	icon_state = "tribe"
	ambience = list('sound/f13ambience/wasteland.ogg')
	ambientmusic = list('sound/f13music/fo2_village.ogg','sound/f13music/fo2_wasteland.ogg','sound/misc/null.ogg')
	ambientsounds = list('sound/f13ambience/dog_distant_1.ogg','sound/f13ambience/dog_distant_2.ogg','sound/f13ambience/dog_distant_3.ogg', \
	'sound/ambience/bird1.ogg','sound/ambience/bird2.ogg','sound/ambience/bird3.ogg','sound/ambience/seag3.ogg','sound/ambience/seag4.ogg')
	outdoors = 1
	open_space = 1
	blob_allowed = 0
	environment = 15

/area/f13/village
	name = "Village"
	icon_state = "village"
	ambience = list('sound/f13ambience/wasteland.ogg')
	ambientmusic = list('sound/f13music/fo2_village.ogg','sound/f13music/fo2_wasteland.ogg','sound/misc/null.ogg')
	ambientsounds = list('sound/f13ambience/dog_distant_1.ogg','sound/f13ambience/dog_distant_2.ogg','sound/f13ambience/dog_distant_3.ogg', \
	'sound/ambience/bird1.ogg','sound/ambience/bird2.ogg','sound/ambience/bird3.ogg','sound/ambience/seag3.ogg','sound/ambience/seag4.ogg')
	outdoors = 1
	open_space = 1
	blob_allowed = 0
	environment = 15

/area/f13/outpost
	name = "Outpost"
	icon_state = "outpost"
	ambience = list('sound/f13ambience/wasteland.ogg')
	ambientmusic = list('sound/f13music/fo2_outpost.ogg','sound/f13music/fo2_brotherhood.ogg','sound/misc/null.ogg')
	ambientsounds = list('sound/f13ambience/battle_1.ogg','sound/f13ambience/battle_2.ogg','sound/f13ambience/battle_3.ogg', \
	'sound/ambience/bird1.ogg','sound/ambience/seag3.ogg','sound/ambience/seag4.ogg')
	outdoors = 1
	open_space = 1
	blob_allowed = 0
	environment = 16

/area/f13/hub
	name = "Hub"
	icon_state = "hub"
	ambience = list('sound/f13ambience/wasteland.ogg')
	ambientmusic = list('sound/f13music/fo2_hub.ogg','sound/f13music/fo2_village.ogg','sound/misc/null.ogg')
	ambientsounds = list('sound/f13ambience/dog_distant_1.ogg','sound/f13ambience/dog_distant_2.ogg','sound/f13ambience/dog_distant_3.ogg', \
	'sound/f13ambience/rattlesnake_1.ogg','sound/f13ambience/rattlesnake_2.ogg','sound/f13ambience/rattlesnake_3.ogg')
	outdoors = 1
	open_space = 1
	blob_allowed = 0
	environment = 16

/area/f13/city
	name = "City"
	icon_state = "city"
	ambience = list('sound/f13ambience/wasteland.ogg')
	ambientmusic = list('sound/f13music/fo2_city.ogg','sound/f13music/fo2_hub.ogg','sound/misc/null.ogg')
	ambientsounds = list('sound/f13ambience/dog_distant_1.ogg','sound/f13ambience/dog_distant_2.ogg','sound/f13ambience/dog_distant_3.ogg', \
	'sound/ambience/ambigen1.ogg','sound/ambience/ambigen2.ogg')
	outdoors = 1
	open_space = 1
	blob_allowed = 0
	environment = 16

/area/f13/chapel
	name = "Chapel"
	icon_state = "chapel"
	ambience = list('sound/f13ambience/building.ogg')
	ambientmusic = list('sound/f13music/fo2_chapel.ogg','sound/misc/null.ogg')
	ambientsounds = list('sound/ambience/ambicha1.ogg','sound/ambience/ambicha2.ogg','sound/ambience/ambicha3.ogg','sound/ambience/ambicha4.ogg')
	environment = 5

/area/f13/bar
	name = "Bar"
	icon_state = "bar"
	ambience = list('sound/f13ambience/building.ogg')
	ambientmusic = list('sound/f13music/fo2_bar.ogg','sound/f13music/fo2_outpost.ogg','sound/misc/null.ogg')
	environment = 2

/area/f13/casino
	name = "Casino"
	icon_state = "casino"
	ambience = list('sound/f13ambience/building.ogg')
	ambientmusic = list('sound/f13music/fo2_bar.ogg','sound/f13music/fo2_raiders.ogg','sound/misc/null.ogg')
	ambientsounds = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg', \
	'sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg')
	environment = 6

/area/f13/clinic
	name = "Clinic"
	icon_state = "clinic"
	ambience = list('sound/f13ambience/building.ogg')
	ambientmusic = list('sound/f13music/fo2_necropolis.ogg','sound/f13music/fo2_ruins.ogg','sound/f13music/fo2_tunnels.ogg','sound/f13music/fo2_caves.ogg','sound/f13music/fo2_desert.ogg','sound/misc/null.ogg')
	ambientsounds = list('sound/ambience/ambigen1.ogg','sound/ambience/ambigen2.ogg','sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg', \
	'sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg')
	environment = 6

/area/f13/office
	name = "Office"
	icon_state = "office"
	ambience = list('sound/f13ambience/shack.ogg')
	ambientmusic = list('sound/f13music/fo2_city.ogg','sound/f13music/fo2_ruins.ogg','sound/misc/null.ogg')
	ambientsounds = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg', \
	'sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg')
	environment = 2

/area/f13/store
	name = "Store"
	icon_state = "store"
	ambience = list('sound/f13ambience/building.ogg')
	ambientmusic = list('sound/f13music/fo2_bar.ogg','sound/f13music/fo2_outpost.ogg','sound/misc/null.ogg')
	ambientsounds = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg', \
	'sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg')
	environment = 4

/area/f13/bunker
	name = "Bunker"
	icon_state = "bunker"
	ambience = list('sound/f13ambience/building.ogg')
	ambientmusic = list('sound/f13music/fo2_vats.ogg','sound/f13music/fo2_outpost.ogg','sound/f13music/fo2_ruins.ogg','sound/misc/null.ogg')
	ambientsounds = list('sound/ambience/ambigen1.ogg','sound/ambience/ambigen2.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg', \
	'sound/ambience/ambigen12.ogg','sound/ambience/ambigen13.ogg')
	environment = 11

/area/f13/tunnel
	name = "Tunnel"
	icon_state = "tunnel"
	ambience = list('sound/f13ambience/cave.ogg')
	ambientmusic = list('sound/f13music/fo2_tunnels.ogg','sound/f13music/fo2_caves.ogg','sound/f13music/fo2_vats.ogg','sound/misc/null.ogg')
	ambientsounds = list('sound/ambience/ambigen9.ogg','sound/ambience/ambigen12.ogg','sound/f13effects/steam_short.ogg','sound/f13effects/steam_long.ogg')
	environment = 21

/area/f13/sewer
	name = "Sewer"
	icon_state = "sewer"
	ambience = list('sound/f13ambience/sewer.ogg')
	ambientmusic = list('sound/f13music/fo2_tunnels.ogg','sound/f13music/fo2_caves.ogg','sound/f13music/fo2_desert.ogg','sound/f13music/fo2_vats.ogg','sound/misc/null.ogg')
	ambientsounds = list('sound/ambience/ambigen9.ogg','sound/f13effects/steam_short.ogg','sound/f13effects/steam_long.ogg')
	environment = 21

/area/f13/caves
	name = "Caves"
	icon_state = "caves"
	ambience = list('sound/f13ambience/cave.ogg')
	ambientmusic = list('sound/f13music/fo2_caves.ogg','sound/f13music/fo2_desert.ogg','sound/f13music/fo2_necropolis.ogg','sound/misc/null.ogg')
	ambientsounds = list('sound/ambience/ambigen15.ogg','sound/ambience/ambigen16.ogg','sound/ambience/ambigen17.ogg')
	environment = 8

/area/f13/subway
	name = "Subway"
	icon_state = "subway"
	ambience = list('sound/f13ambience/cave.ogg')
	ambientmusic = list('sound/f13music/fo2_tunnels.ogg','sound/f13music/fo2_caves.ogg','sound/f13music/fo2_vats.ogg','sound/misc/null.ogg')
	ambientsounds = list('sound/ambience/ambigen1.ogg','sound/ambience/ambigen2.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen12.ogg')
	environment = 21

/area/f13/secret
	name = "Secret"
	icon_state = "secret"
	ambience = list('sound/f13ambience/building.ogg')
	ambientmusic = list('sound/f13music/fo2_chapel.ogg','sound/f13music/fo2_city.ogg','sound/f13music/fo2_outpost.ogg','sound/misc/null.ogg')
	ambientsounds = list('sound/ambience/signal.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg', \
	'sound/ambience/ambigen12.ogg','sound/ambience/ambigen13.ogg')
	environment = 11

/area/f13/radiation
	name = "Radiation"
	icon_state = "radiation"
	ambience = list('sound/f13ambience/wasteland.ogg')
	ambientmusic = list('sound/f13music/fo2_wasteland.ogg','sound/f13music/fo2_desert.ogg','sound/f13music/fo2_world.ogg','sound/misc/null.ogg')
	ambientsounds = list('sound/f13ambience/rattlesnake_1.ogg','sound/f13ambience/rattlesnake_2.ogg','sound/f13ambience/rattlesnake_3.ogg')
	environment = 19

//Faction related areas

/area/f13/raiders
	name = "Raiders"
	icon_state = "raiders"
	ambience = list('sound/f13ambience/wasteland.ogg')
	ambientmusic = list('sound/f13music/fo2_raider.ogg','sound/f13music/fo2_raiders.ogg','sound/misc/null.ogg')
	ambientsounds = list('sound/ambience/ambigen1.ogg','sound/ambience/ambigen2.ogg','sound/f13ambience/dog_distant_1.ogg','sound/f13ambience/dog_distant_2.ogg','sound/f13ambience/dog_distant_3.ogg', \
	'sound/f13ambience/battle_1.ogg','sound/f13ambience/battle_2.ogg','sound/f13ambience/battle_3.ogg')
	outdoors = 1
	open_space = 1
	blob_allowed = 0
	environment = 6

/area/f13/vault
	name = "Vault"
	icon_state = "vaulttec"
	ambience = list('sound/f13ambience/vaulttec_vault.ogg')
	ambientmusic = list('sound/f13music/fo2_vats.ogg','sound/misc/null.ogg')
	ambientsounds = list('sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambigen12.ogg', \
	'sound/ambience/ambigen13.ogg','sound/ambience/ambigen14.ogg','sound/f13effects/steam_short.ogg','sound/f13effects/steam_long.ogg')
	environment = 6

/area/f13/brotherhood
	name = "Brotherhood Of Steel"//Brother Hood
	icon_state = "brotherhood"
	ambience = list('sound/f13ambience/enclave_vault.ogg')
	ambientmusic = list('sound/f13music/fo2_brotherhood.ogg','sound/f13music/fo2_outpost.ogg','sound/misc/null.ogg')
	ambientsounds = list('sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg', \
	'sound/ambience/ambigen12.ogg','sound/ambience/ambigen13.ogg')
	environment = 6

/area/f13/enclave
	name = "Enclave"
	icon_state = "enclave"
	ambience = list('sound/f13ambience/enclave_vault.ogg')
	ambientmusic = list('sound/f13music/fo2_vats.ogg','sound/f13music/fo2_outpost.ogg','sound/misc/null.ogg')
	ambientsounds = list('sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambigen12.ogg', \
	'sound/ambience/ambigen13.ogg','sound/ambience/ambigen14.ogg')
	environment = 6

/area/f13/ncr
	name = "NCR"
	icon_state = "ncr"
	ambience = list('sound/f13ambience/wasteland.ogg')
	ambientmusic = list('sound/f13music/fo2_city.ogg','sound/f13music/fo2_outpost.ogg','sound/misc/null.ogg')
	ambientsounds = list('sound/f13ambience/battle_1.ogg','sound/f13ambience/battle_2.ogg','sound/f13ambience/battle_3.ogg', \
	'sound/f13ambience/dog_distant_1.ogg','sound/f13ambience/dog_distant_2.ogg','sound/f13ambience/dog_distant_3.ogg')
	outdoors = 1
	open_space = 1
	blob_allowed = 0
	environment = 4

/area/f13/legion
	name = "Legion"
	icon_state = "legion"
	ambience = list('sound/f13ambience/wasteland.ogg')
	ambientmusic = list('sound/f13music/fo2_hub.ogg','sound/f13music/fo2_outpost.ogg','sound/misc/null.ogg')
	ambientsounds = list('sound/f13ambience/battle_1.ogg','sound/f13ambience/battle_2.ogg','sound/f13ambience/battle_3.ogg', \
	'sound/f13ambience/dog_distant_1.ogg','sound/f13ambience/dog_distant_2.ogg','sound/f13ambience/dog_distant_3.ogg')
	outdoors = 1
	open_space = 1
	blob_allowed = 0
	environment = 4

/area/f13/followers
	name = "Followers of the Apocalypse"
	icon_state = "followers"
	ambience = list('sound/f13ambience/building.ogg')
	ambientmusic = list('sound/f13music/fo2_vats.ogg','sound/f13music/fo2_outpost.ogg','sound/misc/null.ogg')
	ambientsounds = list('sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambigen12.ogg', \
	'sound/ambience/ambigen13.ogg','sound/ambience/signal.ogg')
	environment = 5