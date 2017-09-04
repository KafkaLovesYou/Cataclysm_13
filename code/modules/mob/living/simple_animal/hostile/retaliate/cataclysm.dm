/***********        Mob type definitions         ***********/
///Instectoid Definition
/mob/living/simple_animal/hostile/retaliate/insectoid
	name = "instectoid"
	desc = "Insectoid, RUN!"
	icon = 'icons/mob/cataclysm.dmi'
	icon_state = ""
	icon_living = "nosprite"
	icon_dead = "nosprite_d"
	speak = list("buzzes")
	emote_see = list("shivers.", "shakes.")
	speak_chance = 1
	turns_per_move = 5
	maxHealth = 15
	health = 15
	melee_damage_lower = 8
	melee_damage_upper = 20
	attacktext = "bites"
	response_help  = "pets"
	response_disarm = "pokes"
	response_harm   = "splats"
	density = 1
	ventcrawler = VENTCRAWLER_ALWAYS
	faction = list("insectoid") //do not count insectoids as hostile faction
		//Instectoid factions:
		//Ants
		//Swamp
		//Spiders
		//Bees
	butcher_results = list(/obj/item/stack/sheet/chitin = 2, /obj/item/weapon/reagent_containers/food/snacks/meat/slab/tainted = 1)
	//pass_flags = PASSTABLE | PASSGRILLE | PASSMOB
	mob_size = MOB_SIZE_HUMAN
	gold_core_spawnable = 1

/*mob/living/simple_animal/hostile/retaliate/insectoid/New()
	..()
	var/list/options = typesof(/mob/living/simple_animal/hostile/retaliate/insectoid)
	var/PICK= options[rand(1,options.len)]
	if(prob(90))
		new PICK(src.loc)
		qdel(src)

*/
/mob/living/simple_animal/hostile/retaliate/insectoid/Crossed(AM as mob|obj)
	if(!stat && isliving(AM))
		var/mob/living/L = AM
		if(L.mob_size > MOB_SIZE_TINY)
			playsound(src, 'sound/f13items/holodisk_cursed.ogg', 50, 1)









/***********     Here go the actual mobs        ***********/

///    ANTS
/mob/living/simple_animal/hostile/retaliate/insectoid/ant
	name = "giant ant"
	desc = "Like an ant, but huger."
	icon_state = "ant_normal"
	icon_living = "ant_normal"
	icon_dead = "ant_dead"
	speak = list("chitters")
	emote_see = list("shivers.", "shakes.")
	speak_chance = 1
	turns_per_move = 8
	maxHealth = 30
	health = 30
	melee_damage_lower = 25
	melee_damage_upper = 40
	attacktext = "bites"
	faction = list("insectoid","ant")

/mob/living/simple_animal/hostile/retaliate/insectoid/ant/soldier
	name = "soldier ant"
	icon_state = "ant_soldier"
	icon_living = "ant_soldier"
	turns_per_move = 4
	maxHealth = 40
	health = 40
	melee_damage_lower = 30
	melee_damage_upper = 60
	butcher_results = list(/obj/item/stack/sheet/chitin = 3, /obj/item/weapon/reagent_containers/food/snacks/meat/slab/tainted = 3)

/mob/living/simple_animal/hostile/retaliate/insectoid/ant/queen
	//TODO: Make her call for help from other ants somehow
	name = "ant queen"
	icon_state = "ant_queen"
	icon_living = "ant_queen"
	turns_per_move = 12
	maxHealth = 125
	health = 125
	melee_damage_lower = 20
	melee_damage_upper = 50
	//Some extra goodies would be cool
	butcher_results = list(/obj/item/stack/sheet/chitin = 6, /obj/item/weapon/reagent_containers/food/snacks/meat/slab/tainted = 4)

//mob/living/simple_animal/hostile/retaliate/insectoid/ant/larva
//construct/ant_hill_stuff



/// SWAMP THINGS
/mob/living/simple_animal/hostile/retaliate/insectoid/wasp
	name = "giant wasp"
	desc = "Stings like a bee - err, wait..."
	icon_state = "wasp"
	icon_living = "wasp"
	icon_dead = "wasp_d"
	speak = list("buzzes")
	emote_see = list("shivers.", "shakes.","flaps its wings.")
	speak_chance = 1
	turns_per_move = 2
	maxHealth = 30
	health = 30
	melee_damage_lower = 40
	melee_damage_upper = 60
	melee_damage_type  = STAMINA
	attacktext = "stings"
	faction = list("insectoid","swamp")
	movement_type = FLYING

/mob/living/simple_animal/hostile/retaliate/insectoid/wasp/dermatik
	name = "dermatik"
	desc = "Looks like a giant wasp, but has an oddly shaped stinger."
	icon_state = "dermatik"
	icon_living = "dermatik"
	icon_dead = "dermatik_d"


/mob/living/simple_animal/hostile/retaliate/insectoid/bee
	name = "giant bee"
	desc = "Stings like a bee - because it <i>is</i> a bee."
	icon_state = "bee_giant"
	icon_living = "bee_giant"
	icon_dead = "bee_giant_d"
	speak = list("buzzes")
	emote_see = list("shivers.", "shakes.","flaps its wings.")
	speak_chance = 1
	turns_per_move = 3
	maxHealth = 50
	health = 50
	melee_damage_lower = 30
	melee_damage_upper = 55
	attacktext = "stings"
	faction = list("insectoid","bee")
	movement_type = FLYING

//construct/bee_hive_stuff
//item/royal_jelly

/mob/living/simple_animal/hostile/retaliate/insectoid/fly
	name = "giant fly"
	desc = "Why do these things need, like, a million eyes?"
	icon_state = "fly"
	icon_living = "fly"
	icon_dead = "fly_d"
	speak = list("buzzes")
	emote_see = list("shivers.", "shakes.","flaps its wings.")
	speak_chance = 9
	turns_per_move = 2
	maxHealth = 25
	health = 25
	melee_damage_lower = 25
	melee_damage_upper = 30
	melee_damage_type  = TOX
	attacktext = "crushes"
	faction = list("insectoid","swamp")
	movement_type = FLYING
	pass_flags = PASSTABLE

/mob/living/simple_animal/hostile/retaliate/insectoid/mosquito
	name = "giant mosquito"
	desc = "When it's big like this, it looks almost like a daddy longlegs - only bigger."
	icon_state = "mosquito"
	icon_living = "mosquito"
	icon_dead = "mosquito_d"
	speak = list("buzzes")
	emote_see = list("shivers.", "shakes.","flaps its wings.")
	speak_chance = 1
	turns_per_move = 1
	maxHealth = 20
	health = 20
	melee_damage_lower = 0
	melee_damage_upper = 70
	melee_damage_type  = TOX
	attacktext = "stings"
	faction = list("insectoid","swamp")
	movement_type = FLYING
	pass_flags = PASSTABLE | PASSMOB

//mob/living/simple_animal/hostile/retaliate/insectoid/maggot


//mob/living/simple_animal/hostile/retaliate/insectoid/dermatik_larva
	//basically a dermatik chestburster

//mob/living/simple_animal/hostile/retaliate/insectoid/dragonfly


//mob/living/simple_animal/hostile/retaliate/insectoid/centipede


//mob/living/simple_animal/hostile/retaliate/insectoid/slug


//mob/living/simple_animal/hostile/retaliate/insectoid/antlion




///   PLANTOIDS

//mob/living/simple_animal/hostile/retaliate/plantoid/


//mob/living/simple_animal/hostile/retaliate/plantoid/triffid


//mob/living/simple_animal/hostile/retaliate/plantoid/triffid/queen


//mob/living/simple_animal/hostile/retaliate/plantoid/triffid/young


//construct/triffid_heart


//mob/living/simple_animal/hostile/retaliate/plantoid/fungaloid


//mob/living/simple_animal/hostile/retaliate/plantoid/fungaloid/bloomer


//mob/living/simple_animal/hostile/retaliate/plantoid/fungaloid_spore


//construct/fungal_wall

//construct/fungal_spire

//ghoul/fungal_zombie

//ant/fungal





///   HORRORS

//mob/living/simple_animal/hostile/horror


//mob/living/simple_animal/hostile/horror/amigara


//mob/living/simple_animal/hostile/horror/blankbody


//mob/living/simple_animal/hostile/horror/twistedbody


//mob/living/simple_animal/hostile/horror/gozu


//mob/living/simple_animal/hostile/horror/amoebicmold


//mob/living/simple_animal/hostile/horror/flesh/angel


//mob/living/simple_animal/hostile/horror/flesh/monk


//mob/living/simple_animal/hostile/horror/thing



///   RANDOM MUTANTS

//mob/living/simple_animal/hostile/giant_rant/ratking


//mob/living/simple_animal/hostile/giant_rant






/***********     Mob spawners n shit        ***********/


