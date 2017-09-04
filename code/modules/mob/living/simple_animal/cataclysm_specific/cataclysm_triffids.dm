#define SPINNING_WEB 1
#define LAYING_EGGS 2
#define MOVING_TO_TARGET 3
#define SPINNING_COCOON 4

/mob/living/simple_animal/hostile/triffid
	name = "triffid"
	desc = "A plant that grows as high as your head, with one thick, bark-coated stalk supporting a flower-like head with a sharp sting within."
	icon = 'icons/obj/flora/triffids.dmi'
	icon_state = "triffid2"
	icon_living = "triffid2"
	icon_dead = "triffid_d"
	faction = list("triffid","plants","vines")
//	butcher_results = list(/obj/item/weapon/reagent_containers/food/snacks/meat/slab/spider = 4)
	maxHealth = 40
	health = 40
	melee_damage_lower = 10
	melee_damage_upper = 20
	deathmessage = "is torn apart!"
	attacktext = "stings"
	del_on_death = 1
	loot = list(/obj/structure/triffid/triffid_dead, /obj/effect/decal/cleanable/greengibs)

/mob/living/simple_animal/hostile/triffid/young
	name = "young triffid"
	desc = "A plant, only a few feet tall, with one thick stalk supporting a flower-like head with a sharp sting within."
	icon_state = "triffid1"
	icon_living = "triffid1"
	maxHealth = 25
	health = 25
	melee_damage_lower = 5
	melee_damage_upper = 15

/mob/living/simple_animal/hostile/triffid/queen
	name = "triffid queen"
	desc = "A very large triffid, with a particularly vicious sting and thick bark."
	icon_state = "triffidQueen"
	icon_living = "triffidQueen"
	maxHealth = 150
	health = 150
	melee_damage_lower = 5
	melee_damage_upper = 15
	var/busy = 0
	environment_smash = 1

//we only have one queen!
/mob/living/simple_animal/hostile/triffid/queen/New()
	var/list/Queens = new()
	for(var/mob/living/simple_animal/hostile/triffid/queen/Q in world)
		Queens += Q
	if(Queens.len > 1) //if there's more than one queen, become a regular triffid
		new /mob/living/simple_animal/hostile/triffid(src.loc)
		qdel(src)
		del(Queens)
	..()

//make newlings code goes here
/mob/living/simple_animal/hostile/triffid/queen/handle_automated_action()
	if(..())
		if(!busy && prob(3))	//3% chance to stop wandering lay eggs
			LayEggs()
	else
		busy = 0
		stop_automated_movement = 0

/mob/living/simple_animal/hostile/triffid/queen/proc/LayEggs()
	var/obj/structure/triffid/newborn/E = locate() in get_turf(src)
	if(stat == DEAD)
		return
	if(E)
		return 0
	else if(busy != LAYING_EGGS)
		busy = LAYING_EGGS
		src.visible_message("<span class='notice'>\The [src] extrudes a piece of plant matter.</span>")
		stop_automated_movement = 1
		if(do_after(src, 50, target = src.loc))
			if(busy == LAYING_EGGS)
				E = locate() in get_turf(src)
				if(!E)
					var/obj/structure/triffid/newborn/C = new /obj/structure/triffid/newborn(src.loc)
					C.faction = faction.Copy()
		busy = 0
		stop_automated_movement = 0



/obj/structure/triffid/newborn
	name = "plant matter"
	desc = "It seems to pulse slightly with an inner life"
	icon = 'icons/obj/flora/triffids.dmi'
	icon_state = "eggs"
	var/amount_grown = 0
	var/list/faction = list("triffid","plants")

/obj/structure/triffid/newborn/New()
	pixel_x = rand(3,-3)
	pixel_y = rand(3,-3)
	START_PROCESSING(SSobj, src)
	. = ..()

/obj/structure/triffid/newborn/process()
	amount_grown += rand(0,4)
	if(amount_grown >= 1250)
		var/mob/living/simple_animal/hostile/triffid/young/Y = new /mob/living/simple_animal/hostile/triffid/young(src.loc)
		Y.faction = faction.Copy()
		qdel(src)



/mob/living/simple_animal/hostile/triffid/young/New()
	..()
	var/growTime = rand(3000,20000) //up to about half an hour
	spawn(growTime)
		if(src)
			var/obj/structure/triffid/triffid_growing/T = new /obj/structure/triffid/triffid_growing(src.loc)
			T.obj_integrity = health //transfer health from young triffid to grown triffid
			qdel(src)





/obj/structure/triffid/triffid_growing
	name = "triffid"
	desc = "A plant as high as your shoulders, with one thick, bark-coated stalk supporting a flower-like head with a sharp sting within."
	icon = 'icons/obj/flora/triffids.dmi'
	icon_state = "triffid_closed"
	density = 1
	anchored = 0 //SHOVE IT LADS

/obj/structure/triffid/triffid_growing/New()
	..()
	spawn(50) //wait 5 seconds
		var/mob/living/simple_animal/hostile/triffid/T = new /mob/living/simple_animal/hostile/triffid(src.loc)
		T.health = obj_integrity
		qdel(src)

/obj/structure/triffid/triffid_dead
	name = "dead triffid"
	icon = 'icons/obj/flora/triffids.dmi'
	icon_state = "triffid_d"
	density = 1
	anchored = 0
	obj_integrity = 100

/obj/structure/triffid/triffid_dead/attackby(obj/item/weapon/W, mob/user, params)
	if(W.sharpness && W.force > 0 && !(NODECONSTRUCT in flags))
		to_chat(user, "You begin to butcher [src]...")
		if(do_after(user, 150/W.force, target = user))
			to_chat(user, "<span class='notice'>You've butchered [src]</span>")
			new /obj/item/weapon/reagent_containers/food/snacks/meat/slab/triffid(get_turf(src))
			if(prob(50))
				new /obj/item/weapon/reagent_containers/food/snacks/meat/slab/triffid(get_turf(src))
				if(prob(66))
					new /obj/item/weapon/reagent_containers/food/snacks/meat/slab/triffid(get_turf(src))
				if(prob(33))
					new /obj/item/weapon/reagent_containers/food/snacks/meat/slab/triffid(get_turf(src))
			if(prob(75))
				new /obj/item/stack/sheet/sinew/plant(get_turf(src))
				if(prob(50))
					new /obj/item/stack/sheet/sinew/plant(get_turf(src))
					if(prob(66))
						new /obj/item/stack/sheet/sinew/plant(get_turf(src))
			qdel(src)
			return 1
	else
		. = ..()

/obj/effect/decal/cleanable/greengibs
	name = "plant juice"
	desc = "It's not exactly blood, is it?"
	icon = 'icons/effects/blood.dmi'
	icon_state = "xfloor1"
	random_icon_states = list("xfloor1", "xfloor2", "xfloor3", "xfloor4", "xfloor5", "xfloor6", "xfloor7")




