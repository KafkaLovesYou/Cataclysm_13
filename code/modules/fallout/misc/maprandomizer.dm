//This is where docking ports for various types of buildings are defined and procced for random movement to main map
//TODO: Rotate shuttle (building) when moving (line 35)

/obj/maprandomizer_spawner/New()
	..()
	new /obj/maprandomizer(src.loc)
	qdel(src)

/obj/maprandomizer/New()
	spawn(10) //just stagger it a bit, idk
	..()
	world.log << "new map randomizer initialized."
	var/list/Lots = new()
	var/list/Buildings = new()
	var/MobileID = 1

	for(var/obj/docking_port/mobile/building/ToBuild in world)
		ToBuild.id = "[MobileID]" //increment mobile dock's ID
		MobileID ++

		Buildings += ToBuild.id //add that ID to list of buildings


	for(var/obj/docking_port/stationary/building/ToLot in world)
		Lots += ToLot //add lot ID to list of lots

	var/countLots = Lots.len //We can't just use the list because we'll be manipulating the list length in the for loop below


	for(var/i = 0, i < countLots, i++)
		var/thisLot = pick(Lots)
		var/thisBuilding = pick(Buildings)

		var/obj/docking_port/mobile/M = SSshuttle.getShuttle("[thisBuilding]")
		//Rotate M somehow
		M.dock(thisLot, TRUE) //move building[thisBuilding] (M) to thisLot
		world.log << "moved building[thisBuilding] to [thisLot]."

		Lots -= thisLot //remove thisLot from list Lots
		Buildings -= thisBuilding //remove thisBuilding from list Buildings

	world.log << "deleting map randomizer, finishing map randomization protocol."
	qdel(src)


/obj/docking_port/stationary/building
	name = "building lot"
	id = "lot"
	dwidth  = 0
	dheight = 0
	width   = 8
	height  = 8


/obj/docking_port/mobile/building
	name = "building mobile"
	id = "building"

	dwidth  = 0
	dheight = 0
	width   = 8
	height  = 8
	dir = NORTH
	port_angle = 0


