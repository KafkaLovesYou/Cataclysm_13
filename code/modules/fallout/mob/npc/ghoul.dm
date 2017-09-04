//Fallout 13 npc ghouls directory

/mob/living/simple_animal/hostile/ghoul
	name = "zombie"
	desc = "Zombies are necrotic post-humans - decrepit, rotting mutants."
	icon = 'icons/fallout/mobs/animal.dmi'
	//randomize icon_state
	//var/myIcon = list("retro_ghoul","retro_ghoul","retro_ghoul","naked_ghoul", "angry_ghoul")
	icon_state = "retro_ghoul"
	icon_living = "retro_ghoul"
	icon_dead = "naked_ghoul_d"
	icon_gib = "gib"
	speak_chance = 0
	turns_per_move = 5
	environment_smash = 0
	response_help = "hugs"
	response_disarm = "pushes aside"
	response_harm = "slaps"
	move_to_delay = 4
	maxHealth = 60
	health = 60
	self_weight = 45
	var/zrole = "" 		//an adjective that decides role, to be used for clothing and equipment
	var/zadjective = "" //an adjective that decides special characteristics
	butcher_results = list(/obj/item/weapon/reagent_containers/food/snacks/meat/slab/tainted = 2, /obj/item/stack/sheet/bone = 1)
	faction = list("ghoul")

	sound_speak_chance = 3
	sound_speak = list('sound/f13npc/ghoul_charge1.ogg','sound/f13npc/ghoul_charge2.ogg','sound/f13npc/ghoul_charge3.ogg')

	aggro_sound_chance = 10
	aggro_sound = 'sound/f13npc/ghoul_alert.ogg'

	death_sound = 'sound/f13npc/ghoul_death.ogg'

	melee_damage_lower = 13
	melee_damage_upper = 17
	aggro_vision_range = 10
	idle_vision_range = 7
	attacktext = "scratches"
	attack_sound = "punch"


/mob/living/simple_animal/hostile/ghoul/New()
	..()
	butcher_results = list(/obj/item/weapon/reagent_containers/food/snacks/meat/slab/tainted = rand(2,4), /obj/item/stack/sheet/bone = rand(0,2))
	//randomize sprite, if there are more suitable sprites for role or adjective, that'll be handled below
	icon_state = "zombie[pick(rand(3,8),rand(5,8))]"

	//if we don't already have zroles and zadjs, assign some
	if(zrole == "" && prob(35))
		RandomRole()
	if(zadjective == "" && prob(20))
		RandomAdjective()

	AssignRolesAndAdjectives() //assign roles and adjectives, duh
	if(prob(50))
		RollForSpecial() //just for fun, chance of going special

	//these two IFs are to eliminate redundant spaces
	if(zrole != "")
		name = "[name] [zrole]"
	if(zadjective != "")
		name = "[zadjective] [name]"

	//do some cleanups, in case of specials etc.
	CleanupRolls()

	//cleaning up icon stuff, they may have changed during the proc calls
	icon_living = icon_state
	icon_dead = "[icon_state]_d"

	health = rand(maxHealth*0.75, maxHealth) //randomize their health a bit, for balancing

//THIS is where we make random ass zombies, YEAH!!
/mob/living/simple_animal/hostile/ghoul/proc/RandomRole()
	var/myRoles = list("cop"=4, "soldier"=2, "scientist"=2, "brute"=5, "boomer"=2, "spitter"=3, "shocker"=1, "toppler"=2, "howler"=2, "hulk"=1, "runner" = 8)
	zrole = pickweight(myRoles)

/mob/living/simple_animal/hostile/ghoul/proc/RandomAdjective()
	var/myAdj 	= list("irradiated"=15, "charred"=5, "electrified"=5, "flaming"=5, "armored"=1, "rotten"=17,"decayed"=16, "naked"=8, "crawling"=13, "lumbering"=4, "tough"=12, "bloated" = 3, "feral"= 14)
	zadjective = pickweight(myAdj)


/mob/living/simple_animal/hostile/ghoul/proc/AssignRolesAndAdjectives()

	var/image/myUniform = "" //role specific uniforms, arbitrarily pants
	var/image/mySuit =	  "" //role specific suits
	var/image/myHat =	  "" //role or adjective specific hats
	var/image/myEffect =  "" //adjective specific overlay effect
	if(prob(20))
		myUniform = image('icons/fallout/clothing_w/uniform.dmi', loc = src, icon_state = pick("ghoul_s","cloth_s","caravan_s"), layer = ABOVE_MOB_LAYER)

	//Roles
	switch(zrole)
		if("cop") 		//police equipment, lootable
			dextrous = TRUE
			desc += "<br>This one is wearing a police uniform."
			if(prob(50))
				myHat = image('icons/fallout/clothing_w/head.dmi', loc = src, icon_state = "retropolice", layer = ABOVE_MOB_LAYER)
			myUniform = image('icons/fallout/clothing_w/uniform.dmi', loc = src, icon_state = "retro_police_s", layer = ABOVE_MOB_LAYER)
			if(prob(50))
				loot = list(/obj/item/clothing/head/f13/police,/obj/item/clothing/under/f13/police)
			else
				loot = list(/obj/item/clothing/head/f13/police,
							/obj/item/clothing/under/f13/police,
							pick(/obj/item/weapon/gun/ballistic/automatic/pistol/n99,
							/obj/item/weapon/gun/ballistic/automatic/pistol/n99,
							/obj/effect/spawner/lootdrop/ammo,
							/obj/effect/spawner/lootdrop/wrange_middle,
							/obj/effect/spawner/lootdrop/wrange_low,
							/obj/item/weapon/restraints/handcuffs))

		if("soldier") 	//military equipment, lootable, lightly armored, military badge
			force_threshold += 1
			dextrous = TRUE
			myUniform = image('icons/fallout/clothing_w/uniform.dmi', loc = src, icon_state = "combat_s", layer = ABOVE_MOB_LAYER)
			if(prob(33))
				mySuit = image('icons/fallout/clothing_w/suit.dmi', loc = src, icon_state = pickweight(list("bulletproofalt"=5,"ghillie"=1)), layer = ABOVE_MOB_LAYER)
			if(prob(50))
				myHat = image('icons/fallout/clothing_w/head.dmi', loc = src, icon_state = pickweight(list("marine" = 10,"combat_mk1" = 6, "combat_mk2" = 4, "general" = 1, "officer" = 5)), layer = ABOVE_MOB_LAYER)
			if(prob(80))
				loot = list(/obj/item/clothing/under/f13/combat, /obj/effect/spawner/lootdrop/military, /obj/effect/spawner/lootdrop/military)
			else if(prob(50))
				loot = list(/obj/item/clothing/under/f13/combat, pick(/obj/effect/spawner/lootdrop/wrange_middle, /obj/effect/spawner/lootdrop/wrange_high, /obj/effect/spawner/lootdrop/ammo))
			else if(prob(3))
				loot = list(/obj/item/clothing/under/f13/combat, /obj/item/weapon/card/emag/military)
			else
				loot = list(/obj/item/clothing/under/f13/combat, pick(/obj/item/clothing/suit/armor/f13/combat_mk1, /obj/item/clothing/suit/armor/f13/combat_mk2))
			desc += "<br>This one is wearing an army uniform."

		if("scientist") //scientist badge! lootable
			mySuit = image('icons/fallout/clothing_w/suit.dmi', loc = src, icon_state = "followers_t", layer = ABOVE_MOB_LAYER)
			desc += "<br>This one is wearing a labcoat."
			dextrous = TRUE
			if(prob(96))
				loot = list(/obj/item/clothing/suit/toggle/labcoat,
							/obj/effect/spawner/lootdrop/science,
							pick(/obj/item/clothing/mask/surgical,/obj/effect/spawner/lootdrop/science))
			else
				loot = list(/obj/item/clothing/suit/toggle/labcoat,/obj/item/weapon/card/emag/science) //SCIENCE PASS CARD

		if("brute") 	//damage buff
			desc += "<br>This is a big one!"
			melee_damage_lower *= 1.1
			melee_damage_upper *= 1.2
			if(environment_smash <2) environment_smash+= 2
			armour_penetration += 5
		if("boomer") 	//kamikaze toxic gibself
			desc += "<br>This one looks like it's about to burst!"
			loot += list(/obj/item/weapon/grenade/chem_grenade/boomer_gib, /obj/effect/decal/cleanable/xenoblood/xgibs)
			color = "fff4fc"
		if("spitter") 	//ranged acid/toxic attack
			desc += "<br>It has odd grows on its throat and neck."
			ranged = 1
			projectiletype = /obj/item/projectile/bullet/neurotoxin
			ranged_message = "spits"
			loot += list(/obj/effect/decal/cleanable/xenoblood/xgibs)
		if("shocker") 	//ranged electric attack (taser-ish)
			desc += "<br>It's shivering with electricity."
			ranged = 1
			projectiletype = /obj/item/projectile/energy/electrode/zombie
			ranged_message = "fires"
			ranged_cooldown_time = 60
			color = "f4fcff"
		if("toppler") 	//disarm intent!
			a_intent = INTENT_DISARM
		if("howler") 	//sonic attack, attract zombies
			desc += "<br>Its torso is unusually wide."
			aggro_sound_chance = 10
		if("hulk")		//damage and health buff
			desc += "<br>This is a big one!"
			melee_damage_upper *= 1.3
			melee_damage_lower = melee_damage_upper*0.8
			if(environment_smash <3) environment_smash++
			force_threshold += 5
			armour_penetration += 10
			color = "#89c964"
		if("runner")	//movement speed buff
			desc += "<br>Remarkably athletic, this one."
			lose_patience_timeout += 150
			speed *= 0.5
			if(speed < 0.5)
				speed = 0.5

	//Adjectives
	switch(zadjective)
		if("irradiated") //is radioactive
			desc += "<br>It's glowing green!"
			light_color = LIGHT_COLOR_GREEN
			light_power = 1
			light_range = 2
			SSradiation.processing += src
			icon_state = "naked_glowghoul"
			icon_living = "naked_glowghoul"
			icon_dead = "naked_glowghoul_d"
			color = "f4fff8"

		if("charred")	//is burnt, reduced health, different sprite
			desc += "<br>It's oddly burnt looking."
			maxHealth *= 0.8
			melee_damage_upper *= 0.75
			melee_damage_lower = melee_damage_upper*0.75
			icon_state = "zombie_charred"
			icon_living = "zombie_charred"
			icon_dead = "zombie_charred_d"
			color = "b2a6a2"

		if("electrified")	//is electrified
			desc += "<br>It's crackling with electricity!"
			light_color = LIGHT_COLOR_BLUE
			light_power = 1
			light_range = 1
			melee_damage_type = STAMINA
			myEffect = image('icons/effects/effects.dmi', loc = src, icon_state = "idle", layer = ABOVE_MOB_LAYER)

		if("flaming")		//is ON FIRE
			desc += "<br>It's <i>ON FRIGGIN' FIRE!</i>"
			light_color = LIGHT_COLOR_RED
			light_power = 2
			light_range = 2
			maxbodytemp = 32000
			melee_damage_type = BURN
			damage_coeff = list(BRUTE = 1, BURN = -1, TOX = 1, CLONE = 1, STAMINA = 0, OXY = 0)
			on_fire = 1
			IgniteMob()
			myEffect = image('icons/mob/OnFire.dmi', loc = src, icon_state = "Standing", layer = ABOVE_MOB_LAYER)

		if("armored")		//is the tuffest
			desc += "<br>Its skin looks like leather."
			maxHealth *= 2.5
			force_threshold += 3

		if("rotten")		//is rotten, causes tox damage AOE
			desc += "<br>It looks disgusting, even for a zombie."
			melee_damage_type = TOX
			icon_state = "zombie[pick(3,4)]"
			icon_living = icon_state
			icon_dead = "[icon_state]_d"
			maxHealth -= 10
			melee_damage_upper *= 0.8
			melee_damage_lower = melee_damage_upper*0.5

		if("decayed")		//is rotten, reduced health
			desc += "<br>It looks disgusting, even for a zombie."
			maxHealth *= 0.75
			environment_smash = 0
			melee_damage_type = STAMINA
			melee_damage_upper *= 0.5
			melee_damage_lower = melee_damage_upper*0.75
			icon_state = "zombie[pick(3,4)]"
			icon_living = icon_state
			icon_dead = "[icon_state]_d"

		if("naked")			//is skinless, different sprite
			desc += "<br>Its skin must have melted off."
			icon_state = "zombie_decayed"
			icon_living = "zombie_decayed"
			icon_dead = "zombie_decayed_d"
			maxHealth -= 10

		if("crawling")		//has no legs, crawls a long, speed mod and different sprite, mob size decrease
			desc += "<br>Legless, it seems to just writhe along the ground."
			environment_smash = 0
			stat_attack = 1
			speed = 3
			icon_state = "crawler"
			icon_living = "crawler"
			icon_dead = "crawler_d"
			density = 0 //so you can walk on it
			zone_selected = "left foot"
			pass_flags = PASSTABLE | PASSGRILLE | PASSMOB
			myHat = ""
			myUniform = ""
			mySuit = ""
			myEffect = ""

		if("lumbering")		//is slow and sees poorly, but strong
			desc += "<br>Huge, but seems dumb even for a zombie."
			turns_per_move = 10
			melee_damage_lower *= 0.5 //thus it has a chance of hitting poorly
			melee_damage_upper *= 1.75
			aggro_vision_range *= 0.75
			idle_vision_range *= 0.75
			maxHealth *= 1.25
			maxHealth += 10
			if(environment_smash <3) environment_smash++
			force_threshold += 2
			lose_patience_timeout *= 0.5
			speed = 1.5
			confused = 1

		if("tough")		//is tuff, but not as tuff as armored
			desc += "<br>Its skin looks like leather."
			maxHealth *= 1.75

		if("bloated")	//toxic gibself when dying
			desc += "<br>It looks like it's about to burst!"
			turns_per_move = 4
			light_color = LIGHT_COLOR_GREEN
			light_power = 1
			light_range = 1
			maxHealth += 20
			loot += list(/obj/item/weapon/grenade/chem_grenade/boomer_gib)
			if(prob(33))
				myEffect = image('icons/mob/alien.dmi', loc = src, icon_state = "bursted_stand", layer = ABOVE_MOB_LAYER)

		if("feral")		//speed increase, different sprite (runs on all fours)
		//	if(istype(/mob/living/simple_animal/hostile/ghoul/aggressive/src))
		//		name = "[name] [zrole]"
		//	desc += "<br>This one looks wilder than the average zombie."
			if(environment_smash < 3)
				environment_smash++
			lose_patience_timeout *= 0.5
			stat_attack = 1
			maxHealth -= 10
			mySuit = null

	//	FIX THIS OVERLAY SHIT
	if(myUniform != "")
		overlays += myUniform
	if(mySuit != "")
		overlays += mySuit
	if(myHat != "")
		overlays += myHat
	if(myEffect != "")
		overlays += myEffect

/mob/living/simple_animal/hostile/ghoul/proc/RollForSpecial()
	//extra special double adjectives!
	if(prob(1.5)) //frenzied!
		desc += "<br>Its eyes are piercing..."
		name = "frenzied [name]" //frenzied zombies are removed from the ghoul faction, and should aggro other zombies - and will be VERY strong, but not all too tough
		maxHealth *= 0.85
		melee_damage_upper *= 1.5
		melee_damage_lower = melee_damage_upper //"perfect strike"
		attack_same = 1
		armour_penetration += 5
	else if(prob(0.2)) //YUUUUUGE!!
		desc += "<br><b>It's... ENORMOUS!</b>"
		name = "huge [name]" //huge zombies get a flat buff to melee damage and health
		force_threshold += 2
		melee_damage_lower = melee_damage_upper
		melee_damage_upper *= 3
		environment_smash = 3
		maxHealth *= 2
		armour_penetration += 20
		icon_state = "zombie_huge"
		icon_living = "zombie_huge"
		icon_dead = "zombie_huge_d"
		del_on_death = 1
		speed *= 1.25
		overlays = null
	else if(prob(0.5)) //Necromancer, YUUUUUUUUUUS
		desc = "<br>This zombie almost seems intelligent."
		name = "\proper zombie necromancer"
		icon_state = "zombie"
		icon_living = "zombie"
		icon_dead = "zombie_d"
		maxHealth = 200
		speed = 2 //Slow!
		melee_damage_upper = 0
		melee_damage_lower = 0
		attack_same = 2 //ONLY attack zombies!
		ranged = 1
		projectiletype = /obj/item/projectile/magic/resurrection/necromancer
		ranged_cooldown_time = 60
		stat_attack = 2
		stat_exclusive = 1
		light_color = LIGHT_COLOR_GREEN
		light_power = 1
		light_range = 2
		minimum_distance = 3
		retreat_distance = 5
		friendly = "beckons"
		if(prob(33))
			overlays += image('icons/fallout/clothing_w/head.dmi', loc = src, icon_state = "fez", layer = ABOVE_MOB_LAYER)
		overlays += image('icons/fallout/clothing_w/uniform.dmi', loc = src, icon_state = "rag_s", layer = ABOVE_MOB_LAYER)
		overlays += image('icons/fallout/clothing_w/suit.dmi', loc = src, icon_state = "robe_liz", layer = ABOVE_MOB_LAYER)


/mob/living/simple_animal/hostile/ghoul/proc/CleanupRolls()
	//Some sanity checks and cleanup
	if(zadjective == "crawling" && zrole == "runner") //a crawling runner doesn't make a lick o' sense
		if(name == "huge crawling zombie runner")
			name = "huge zombie"
		else
			name = "zombie crawler"
			desc = "This particular zombie has a certain fixation on the Achilles' tendon."
			desc += "<br>Legless, it seems to just writhe along the ground."
			environment_smash = 0
			stat_attack = 0
			speed = 2.5
			icon_state = "crawler"
			icon_living = "crawler"
			icon_dead = "crawler_d"
			density = 0 //so you can walk on it
			zone_selected = pick("left foot","right foot")

	if(zadjective == "electrified" && zrole == "shocker") //a crawling runner doesn't make a lick o' sense
		if(name == "huge electrified zombie shocker")
			name = "huge coiler zombie"
		else
			name = "coiler zombie"
		maxHealth += 25





///Old ghouls preserved for posterity, or whatever


/mob/living/simple_animal/hostile/ghoul/aggressive
	name = "feral zombie"
	desc = "Similar to other zombies, it's more aggressive and confident about the fact that you are the best food around.<br>It is missing a left arm."
	icon_state = "angry_ghoul"
	icon_living = "angry_ghoul"
	icon_dead = "angry_ghoul_d"
	icon_gib = "gib"
	maxHealth = 80
	health = 80
	melee_damage_lower = 15
	melee_damage_upper = 25
	aggro_vision_range = 15
	idle_vision_range = 10
	attacktext = "chomps"

/mob/living/simple_animal/hostile/ghoul/glowing
	name = "glowing zombie"
	desc = ">ombies are necrotic post-humans - rotting mutants, this one is so irradiated it actually glows in the dark."
	icon_state = "retro_glowghoul"
	icon_living = "retro_glowghoul"
	icon_dead = "retro_glowghoul_d"
	icon_gib = "gib"
	maxHealth = 100
	health = 100
	melee_damage_lower = 15
	melee_damage_upper = 25
	light_color = LIGHT_COLOR_GREEN
	light_power = 1
	light_range = 2

/mob/living/simple_animal/hostile/ghoul/glowing/New()
	..()
	SSradiation.processing += src