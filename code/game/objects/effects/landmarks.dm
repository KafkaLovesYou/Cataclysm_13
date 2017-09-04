/obj/effect/landmark
	name = "landmark"
	icon = 'icons/mob/screen_gen.dmi'
	icon_state = "x2"
	anchored = 1
	invisibility = INVISIBILITY_ABSTRACT

/obj/effect/landmark/New()
	..()
	tag = text("landmark*[]", name)
	landmarks_list += src

	switch(name)			//some of these are probably obsolete
		if("monkey")
			monkeystart += loc
			qdel(src)
			return
		if("start")
			newplayer_start += loc
			qdel(src)
			return
		if("wizard")
			wizardstart += loc
			qdel(src)
			return
		if("JoinLate")
			latejoin += loc
			qdel(src)
			return
		if("prisonwarp")
			prisonwarp += loc
			qdel(src)
			return
		if("Holding Facility")
			holdingfacility += loc
		if("tdome1")
			tdome1	+= loc
		if("tdome2")
			tdome2 += loc
		if("tdomeadmin")
			tdomeadmin	+= loc
		if("tdomeobserve")
			tdomeobserve += loc
		if("prisonsecuritywarp")
			prisonsecuritywarp += loc
			qdel(src)
			return
		if("blobstart")
			blobstart += loc
			qdel(src)
			return
		if("secequipment")
			secequipment += loc
			qdel(src)
			return
		if("Emergencyresponseteam")
			emergencyresponseteamspawn += loc
			qdel(src)
			return
		if("xeno_spawn")
			xeno_spawn += loc
			qdel(src)
			return
	return 1

/obj/effect/landmark/Destroy()
	landmarks_list -= src
	return ..()

/obj/effect/landmark/start
	name = "start"
	icon = 'icons/mob/screen_gen.dmi'
	icon_state = "x"
	anchored = 1

/obj/effect/landmark/start/New()
	..()
	tag = "start*[name]"
	start_landmarks_list += src
	return 1

/obj/effect/landmark/start/Destroy()
	start_landmarks_list -= src
	return ..()

//Costume spawner landmarks

/obj/effect/landmark/costume/New() //costume spawner, selects a random subclass and disappears

	var/list/options = typesof(/obj/effect/landmark/costume)
	var/PICK= options[rand(1,options.len)]
	new PICK(src.loc)
	qdel(src)

//SUBCLASSES.  Spawn a bunch of items and disappear likewise
/obj/effect/landmark/costume/chicken/New()
	new /obj/item/clothing/suit/chickensuit(src.loc)
	new /obj/item/clothing/head/chicken(src.loc)
	new /obj/item/weapon/reagent_containers/food/snacks/egg(src.loc)
	qdel(src)

/obj/effect/landmark/costume/gladiator/New()
	new /obj/item/clothing/under/gladiator(src.loc)
	new /obj/item/clothing/head/helmet/gladiator(src.loc)
	qdel(src)

/obj/effect/landmark/costume/madscientist/New()
	new /obj/item/clothing/under/gimmick/rank/captain/suit(src.loc)
	new /obj/item/clothing/head/flatcap(src.loc)
	new /obj/item/clothing/suit/toggle/labcoat/mad(src.loc)
	qdel(src)

/obj/effect/landmark/costume/elpresidente/New()
	new /obj/item/clothing/under/gimmick/rank/captain/suit(src.loc)
	new /obj/item/clothing/head/flatcap(src.loc)
	new /obj/item/clothing/mask/cigarette/cigar/havana(src.loc)
	new /obj/item/clothing/shoes/jackboots(src.loc)
	qdel(src)

/obj/effect/landmark/costume/nyangirl/New()
	new /obj/item/clothing/under/female/schoolgirl(src.loc)
	new /obj/item/clothing/head/kitty(src.loc)
	new /obj/item/clothing/glasses/sunglasses/blindfold(src.loc)
	qdel(src)

/obj/effect/landmark/costume/maid/New()
	new /obj/item/clothing/under/female/blackskirt(src.loc)
	var/CHOICE = pick( /obj/item/clothing/head/beret , /obj/item/clothing/head/rabbitears )
	new CHOICE(src.loc)
	new /obj/item/clothing/glasses/sunglasses/blindfold(src.loc)
	qdel(src)

/obj/effect/landmark/costume/butler/New()
	new /obj/item/clothing/tie/waistcoat(src.loc)
	new /obj/item/clothing/under/suit_jacket(src.loc)
	new /obj/item/clothing/head/that(src.loc)
	qdel(src)

/obj/effect/landmark/costume/highlander/New()
	new /obj/item/clothing/under/kilt(src.loc)
	new /obj/item/clothing/head/beret(src.loc)
	qdel(src)

/obj/effect/landmark/costume/prig/New()
	new /obj/item/clothing/tie/waistcoat(src.loc)
	new /obj/item/clothing/glasses/monocle(src.loc)
	var/CHOICE= pick( /obj/item/clothing/head/bowler, /obj/item/clothing/head/that)
	new CHOICE(src.loc)
	new /obj/item/clothing/shoes/sneakers/black(src.loc)
	new /obj/item/weapon/cane(src.loc)
	new /obj/item/clothing/under/sl_suit(src.loc)
	new /obj/item/clothing/mask/fakemoustache(src.loc)
	qdel(src)

/obj/effect/landmark/costume/plaguedoctor/New()
	new /obj/item/clothing/suit/bio_suit/plaguedoctorsuit(src.loc)
	new /obj/item/clothing/head/plaguedoctorhat(src.loc)
	new /obj/item/clothing/mask/gas/plaguedoctor(src.loc)
	qdel(src)

/obj/effect/landmark/costume/nightowl/New()
	new /obj/item/clothing/suit/toggle/owlwings(src.loc)
	new /obj/item/clothing/under/owl(src.loc)
	new /obj/item/clothing/mask/gas/owl_mask(src.loc)
	qdel(src)

/obj/effect/landmark/costume/thegriffin/New()
	new /obj/item/clothing/suit/toggle/owlwings/griffinwings(src.loc)
	new /obj/item/clothing/shoes/griffin(src.loc)
	new /obj/item/clothing/under/griffin(src.loc)
	new /obj/item/clothing/head/griffin(src.loc)
	qdel(src)

/obj/effect/landmark/costume/waiter/New()
	new /obj/item/clothing/under/waiter(src.loc)
	var/CHOICE= pick( /obj/item/clothing/head/kitty, /obj/item/clothing/head/rabbitears)
	new CHOICE(src.loc)
	new /obj/item/clothing/suit/apron(src.loc)
	qdel(src)

/obj/effect/landmark/costume/pirate/New()
	new /obj/item/clothing/under/pirate(src.loc)
	new /obj/item/clothing/suit/pirate(src.loc)
	var/CHOICE = pick( /obj/item/clothing/head/pirate , /obj/item/clothing/head/bandana )
	new CHOICE(src.loc)
	new /obj/item/clothing/glasses/eyepatch(src.loc)
	qdel(src)

/obj/effect/landmark/costume/commie/New()
	new /obj/item/clothing/under/soviet(src.loc)
	new /obj/item/clothing/head/ushanka(src.loc)
	qdel(src)

/obj/effect/landmark/costume/imperium_monk/New()
	new /obj/item/clothing/suit/imperium_monk(src.loc)
	if (prob(25))
		new /obj/item/clothing/mask/gas/cyborg(src.loc)
	qdel(src)

/obj/effect/landmark/costume/holiday_priest/New()
	new /obj/item/clothing/suit/holidaypriest(src.loc)
	qdel(src)

/obj/effect/landmark/costume/marisawizard/fake/New()
	new /obj/item/clothing/shoes/sandal/marisa(src.loc)
	new /obj/item/clothing/head/wizard/marisa/fake(src.loc)
	new/obj/item/clothing/suit/wizrobe/marisa/fake(src.loc)
	qdel(src)

/obj/effect/landmark/costume/cutewitch/New()
	new /obj/item/clothing/under/female/sundress(src.loc)
	new /obj/item/clothing/head/witchwig(src.loc)
	new /obj/item/weapon/staff/broom(src.loc)
	qdel(src)

/obj/effect/landmark/costume/fakewizard/New()
	new /obj/item/clothing/shoes/sandal(src.loc)
	new /obj/item/clothing/suit/wizrobe/fake(src.loc)
	new /obj/item/clothing/head/wizard/fake(src.loc)
	new /obj/item/weapon/staff/(src.loc)
	qdel(src)

/obj/effect/landmark/costume/sexyclown/New()
	new /obj/item/clothing/mask/gas/sexyclown(src.loc)
	new /obj/item/clothing/under/female/sexyclown(src.loc)
	qdel(src)

/obj/effect/landmark/costume/sexymime/New()
	new /obj/item/clothing/mask/gas/sexymime(src.loc)
	new /obj/item/clothing/under/female/sexymime(src.loc)
	qdel(src)

//Department Security spawns

/obj/effect/landmark/start/depsec
	name = "department_sec"

/obj/effect/landmark/start/depsec/New()
	..()
	department_security_spawns += src

/obj/effect/landmark/start/depsec/Destroy()
	department_security_spawns -= src
	return ..()

/obj/effect/landmark/start/depsec/supply
	name = "supply_sec"

/obj/effect/landmark/start/depsec/medical
	name = "medical_sec"

/obj/effect/landmark/start/depsec/engineering
	name = "engineering_sec"

/obj/effect/landmark/start/depsec/science
	name = "science_sec"

/obj/effect/landmark/latejoin
	name = "JoinLate"

//generic event spawns
/obj/effect/landmark/event_spawn
	name = "generic event spawn"
	icon_state = "x4"

/obj/effect/landmark/event_spawn/New()
	..()
	generic_event_spawns += src

/obj/effect/landmark/event_spawn/Destroy()
	generic_event_spawns -= src
	return ..()

/obj/effect/landmark/ruin
	var/datum/map_template/ruin/ruin_template

/obj/effect/landmark/ruin/New(loc, my_ruin_template)
	name = "ruin_[ruin_landmarks.len + 1]"
	..(loc)
	ruin_template = my_ruin_template
	ruin_landmarks |= src

/obj/effect/landmark/ruin/Destroy()
	ruin_landmarks -= src
	ruin_template = null
	. = ..()


/obj/effect/landmark/mobspawn/New() //mob spawner, selects a random subclass and disappears

	var/list/options = typesof(/obj/effect/landmark/mobspawn)
	var/PICK= options[rand(1,options.len)]
	new PICK(src.loc)
	qdel(src)

/obj/effect/landmark/mobspawn/cows/New()
	new /mob/living/simple_animal/cow(src.loc)
	if(prob(50))
		new /mob/living/simple_animal/cow(src.loc)
	if(prob(50))
		new /mob/living/simple_animal/cow(src.loc)
	if(prob(50))
		new /mob/living/simple_animal/cow(src.loc)
		if(prob(50))
			new /mob/living/simple_animal/cow(src.loc)
	qdel(src)

/obj/effect/landmark/mobspawn/chickens/New()
	new /mob/living/simple_animal/chicken(src.loc)
	if(prob(75))
		new /mob/living/simple_animal/chicken(src.loc)
		new /mob/living/simple_animal/chick(src.loc)
		if(prob(75))
			new /mob/living/simple_animal/chick(src.loc)
			if(prob(66))
				new /mob/living/simple_animal/chick(src.loc)
				if(prob(50))
					new /mob/living/simple_animal/chick(src.loc)
	if(prob(75))
		new /mob/living/simple_animal/chicken(src.loc)
		if(prob(50))
			new /mob/living/simple_animal/chicken(src.loc)
	qdel(src)

/obj/effect/landmark/mobspawn/mice/New()
	new /mob/living/simple_animal/mouse(src.loc)
	if(prob(75))
		new /mob/living/simple_animal/mouse(src.loc)
	if(prob(50))
		new /mob/living/simple_animal/mouse(src.loc)
	if(prob(35))
		new /mob/living/simple_animal/mouse(src.loc)
	qdel(src)

/obj/effect/landmark/mobspawn/cockroach/New()
	new /mob/living/simple_animal/cockroach(src.loc)
	new /mob/living/simple_animal/cockroach(src.loc)
	if(prob(75))
		new /mob/living/simple_animal/cockroach(src.loc)
	if(prob(25))
		new /mob/living/simple_animal/cockroach(src.loc)
		new /mob/living/simple_animal/cockroach(src.loc)
	qdel(src)

/obj/effect/landmark/mobspawn/wolves/New()
	new /mob/living/simple_animal/hostile/wolf(src.loc)
	new /mob/living/simple_animal/hostile/wolf(src.loc)
	if(prob(80))
		new /mob/living/simple_animal/hostile/wolf/alpha(src.loc)
	if(prob(25))
		new /mob/living/simple_animal/hostile/wolf(src.loc)
		new /mob/living/simple_animal/hostile/wolf(src.loc)
		if(prob(75))
			new /mob/living/simple_animal/hostile/wolf(src.loc)
	qdel(src)



/obj/effect/landmark/mobspawn/hostile/New() //HOSTILE mob spawner, selects a random subclass and disappears

	var/list/options = typesof(/obj/effect/landmark/mobspawn/hostile)
	var/PICK= options[rand(1,options.len)]
	if(prob(90))
		new PICK(src.loc)
	qdel(src)

/obj/effect/landmark/mobspawn/hostile/randomChance/New()
	if(prob(50))
		new /obj/effect/landmark/mobspawn/hostile/random(src.loc)
	if(prob(2))
		new /obj/effect/landmark/mobspawn/hostile/randomChance(src.loc)
	qdel(src)

/obj/effect/landmark/mobspawn/hostile/random/New()
	if(prob(10))
		new /obj/effect/landmark/mobspawn/hostile/zombies(src.loc)
		if(prob(50))
			new /obj/effect/landmark/mobspawn/hostile/zombies(src.loc)
	else if(prob(20))
		new /obj/effect/landmark/mobspawn/hostile/ants(src.loc)
		if(prob(50))
			new /obj/effect/landmark/mobspawn/hostile/ants(src.loc)
	else if(prob(40))
		new /obj/effect/landmark/mobspawn/hostile/swampoids(src.loc)
		if(prob(50))
			new /obj/effect/landmark/mobspawn/hostile/swampoids(src.loc)
	else if(prob(80))
		new /obj/effect/landmark/mobspawn/hostile/spiders(src.loc)
		if(prob(50))
			new /obj/effect/landmark/mobspawn/hostile/spiders(src.loc)
	else
		//triffids
		return
	qdel(src)

/obj/effect/landmark/mobspawn/hostile/zombies/New()
	if(prob(80))
		new /mob/living/simple_animal/hostile/ghoul(src.loc)
		if(prob(20))
			new /mob/living/simple_animal/hostile/ghoul/aggressive(src.loc)
			if(prob(20))
				new /mob/living/simple_animal/hostile/ghoul/aggressive(src.loc)
		else if(prob(10))
			new /mob/living/simple_animal/hostile/ghoul/glowing(src.loc)
		else if(prob(50))
			new /mob/living/simple_animal/hostile/ghoul(src.loc)
			if(prob(50))
				new /mob/living/simple_animal/hostile/ghoul(src.loc)
	qdel(src)

/obj/effect/landmark/mobspawn/hostile/zombies/single/New()
	if(prob(95))
		new /mob/living/simple_animal/hostile/ghoul(src.loc)
	qdel(src)


/obj/effect/landmark/mobspawn/hostile/ants/New()
	new /mob/living/simple_animal/hostile/retaliate/insectoid/ant(src.loc)
	if(prob(99))
		new /mob/living/simple_animal/hostile/retaliate/insectoid/ant(src.loc)
		if(prob(30))
			new /mob/living/simple_animal/hostile/retaliate/insectoid/ant/soldier(src.loc)
			if(prob(20))
				new /mob/living/simple_animal/hostile/retaliate/insectoid/ant/soldier(src.loc)
		else
			new /mob/living/simple_animal/hostile/retaliate/insectoid/ant(src.loc)
			if(prob(50))
				new /mob/living/simple_animal/hostile/retaliate/insectoid/ant(src.loc)
	qdel(src)

/obj/effect/landmark/mobspawn/hostile/ants/with_queen/New()
	new /mob/living/simple_animal/hostile/retaliate/insectoid/ant/queen(src.loc)
	..() //do the rest

/obj/effect/landmark/mobspawn/hostile/swampoids/New() //picks ONE type of insectoid and spawns up to seven of them
	var/list/options = list(/mob/living/simple_animal/hostile/retaliate/insectoid/bee, \
							/mob/living/simple_animal/hostile/retaliate/insectoid/fly, \
							/mob/living/simple_animal/hostile/retaliate/insectoid/wasp, \
						/*	/mob/living/simple_animal/hostile/retaliate/insectoid/dragonfly, \
							/mob/living/simple_animal/hostile/retaliate/insectoid/centipede, \
							/mob/living/simple_animal/hostile/retaliate/insectoid/slug, \
						*/	/mob/living/simple_animal/hostile/retaliate/insectoid/mosquito)
	var/PICK= options[rand(1,options.len)]
	if(prob(98))
		new PICK(src.loc)
		if(prob(75))
			new PICK(src.loc)
		if(prob(50))
			new PICK(src.loc)
			if(prob(25))
				new PICK(src.loc)
				new PICK(src.loc)
				if(prob(50))
					new PICK(src.loc)
					new PICK(src.loc)
	else
		new /mob/living/simple_animal/hostile/retaliate/insectoid/wasp/dermatik(src.loc)
		if(prob(50))
			new /mob/living/simple_animal/hostile/retaliate/insectoid/wasp/dermatik(src.loc)
			if(prob(50))
				new /mob/living/simple_animal/hostile/retaliate/insectoid/wasp/dermatik(src.loc)
	qdel(src)


/obj/effect/landmark/mobspawn/hostile/spiders/New()
	var/list/options = list(/mob/living/simple_animal/hostile/poison/giant_spider/trapdoor, \
							/mob/living/simple_animal/hostile/poison/giant_spider/wolf, \
							/mob/living/simple_animal/hostile/poison/giant_spider/web, \
							/mob/living/simple_animal/hostile/poison/giant_spider/jumping)
	var/PICK= options[rand(1,options.len)]
	new PICK(src.loc)
	if(prob(30))
		new PICK(src.loc)

	if(prob(85))
		new /mob/living/simple_animal/hostile/poison/giant_spider/trapdoor(src.loc)
		if(prob(30))
			new /mob/living/simple_animal/hostile/poison/giant_spider/wolf(src.loc)
		if(prob(30))
			new /mob/living/simple_animal/hostile/poison/giant_spider/web(src.loc)
		if(prob(50))
			new /mob/living/simple_animal/hostile/poison/giant_spider/jumping(src.loc)
		else if(prob(50))
			new PICK(src.loc)
		else
			new /mob/living/simple_animal/hostile/poison/giant_spider/wolf(src.loc)
			if(prob(50))
				new /mob/living/simple_animal/hostile/poison/giant_spider/jumping(src.loc)

	if(prob(15))
		new /mob/living/simple_animal/hostile/poison/giant_spider/blackwidow(src.loc)
		new PICK(src.loc)
	qdel(src)


/obj/effect/landmark/mobspawn/hostile/giant_rats/New()
	qdel(src)