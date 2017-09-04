//Fallout 13 boarding simulation

/obj/structure/barricade/wooden/planks
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "board-4"
	obj_integrity = 120
	max_integrity = 120
	layer = 5
	var/planks = 4
	var/maxplanks = 4

/obj/structure/barricade/wooden/planks/New()
	..()
	checkplanks()
	max_integrity = maxplanks*30

/obj/structure/barricade/wooden/planks/examine()
	..()
	usr << "<span class='notice'>There are [planks] boards left.</span>"

/obj/structure/barricade/wooden/planks/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/weapon/crowbar))
		visible_message("<span class='danger'>[user] begins to pry off a board...</span>")
		if(do_after(user, 30, target = src))
			visible_message("<span class='danger'>[user] pries off a board!</span>")
			planks --
			checkplanks()
			if(prob(33))
				new /obj/item/stack/sheet/mineral/wood(user.loc)
			return
	..()

/obj/structure/barricade/wooden/attackby(obj/item/I, mob/user, params)
	if(istype(src, /obj/structure/barricade/wooden/planks)) //prevent boarded up windows from becoming log walls
		return
	if(istype(I, /obj/item/stack))
		if(iswallturf(loc))
			to_chat(user, "<span class='warning'>There is already a wall present!</span>")
			return
		if (locate(/obj/structure/falsewall) in src.loc.contents)
			to_chat(user, "<span class='warning'>There is already a wall present!</span>")
			return
		if(istype(I, /obj/item/stack/sheet/mineral/wood))
			var/obj/item/stack/sheet/mineral/wood/S = I
			if(S.get_amount() < 3)
				to_chat(user, "<span class='warning'>You need three planks to add boarding!</span>")
				return
			else
				to_chat(user, "<span class='notice'>You start adding boarding...</span>")
				if (do_after(user, 75, target = src))
					if(!src.loc || !I || S.get_amount() < 3)
						return
					S.use(3)
					to_chat(user, "<span class='notice'>You add the boarding, finishing the wall.</span>")
					var/turf/T = get_turf(src)
					T.ChangeTurf(/turf/closed/wall/f13/wood)
					transfer_fingerprints_to(T)
					qdel(src)
		..() //Adding more planks is an afterattack on the sheet type

/obj/structure/barricade/wooden/planks/take_damage()
	..()
	if(obj_integrity <= (planks-1)*30)
		planks --
		checkplanks()
	return

/obj/structure/barricade/wooden/planks/proc/checkplanks()
	obj_integrity = planks*30 //Each board adds 30 health
	icon_state = "board-[planks]"
	if(obj_integrity <= 0)
		qdel(src)

/obj/structure/barricade/wooden/planks/pregame/initialize() //Place these in the map maker to have a bit of randomization with boarded up windows/doors
	planks = rand(1,maxplanks)
	..()