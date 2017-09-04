//Cataclysm varieties; TODO; Setup icon states
//Wolf spiders, fast, low health, aggressive
/mob/living/simple_animal/hostile/poison/giant_spider/wolf
	name = "wolf spider"
	desc = "Furry and brown, it makes you shudder to look at it."
	icon = 'icons/mob/cataclysm.dmi'
	icon_state = "wolf_spider"
	icon_living = "wolf_spider"
	icon_dead = "wolf_spider_dead"
	faction = list("spiders")
	gender = FEMALE
	butcher_results = list(/obj/item/weapon/reagent_containers/food/snacks/meat/slab/spider = 4, /obj/item/weapon/reagent_containers/food/snacks/spiderleg = 8)
	maxHealth = 50
	health = 50
	melee_damage_lower = 5
	melee_damage_upper = 20
	poison_per_bite = 0
	turns_per_move = 10 //which is slow and which is fast? Should be slow

//Web spider, fast, VERY low health, weak, slightly venomous
/mob/living/simple_animal/hostile/poison/giant_spider/web
	name = "web spider"
	icon = 'icons/mob/cataclysm.dmi'
	desc = "A nimble yellow spider the size of a dog."
	icon_state = "web_spider"
	icon_living = "web_spider"
	icon_dead = "web_spider_dead"
	gender = FEMALE
	faction = list("insectoid","spiders")
	butcher_results = list(/obj/item/weapon/reagent_containers/food/snacks/meat/slab/spider = 3, /obj/item/weapon/reagent_containers/food/snacks/spiderleg = 8)
	maxHealth = 75
	health = 75
	melee_damage_lower = 5
	melee_damage_upper = 10
	poison_per_bite = 2
	turns_per_move = 6 //should be  fast

//Jumping spider, VERY fast, VERY agile, VERY weak, quite poisonous
/mob/living/simple_animal/hostile/poison/giant_spider/jumping
	name = "jumping spider"
	icon = 'icons/mob/cataclysm.dmi'
	desc = "Small, furry, almost cute, if it weren't for the pincers."
	icon_state = "jumping_spider"
	icon_living = "jumping_spider"
	icon_dead = "jumping_spider_dead"
	gender = FEMALE
	faction = list("neutral","insectoid","spiders")
	butcher_results = list(/obj/item/weapon/reagent_containers/food/snacks/meat/slab/spider = 1, /obj/item/weapon/reagent_containers/food/snacks/spiderleg = 8)
	maxHealth = 30
	health = 25
	speed = -1
	melee_damage_lower = 4
	melee_damage_upper = 8
	poison_per_bite = 5
	turns_per_move = 3 //should be VERY fast

//Trap door spider, somewhat fast, weak, agile
/mob/living/simple_animal/hostile/poison/giant_spider/trapdoor
	name = "trap door spider"
	icon = 'icons/mob/cataclysm.dmi'
	desc = "A dirty, brown arachnid with an oddly bulbous thorax."
	icon_state = "trapdoor_spider"
	icon_living = "trapdoor_spider"
	icon_dead = "trapdoor_spider_dead"
	gender = FEMALE
	faction = list("spiders")
	butcher_results = list(/obj/item/weapon/reagent_containers/food/snacks/meat/slab/spider = 2, /obj/item/weapon/reagent_containers/food/snacks/spiderleg = 8)
	maxHealth = 50
	health = 50
	melee_damage_lower = 5
	melee_damage_upper = 15
	poison_per_bite = 3
	turns_per_move = 5 //which is slow and which is fast?

//black widow, VERY slow, VERY poisonous, somewhat weak, very faction oriented
/mob/living/simple_animal/hostile/poison/giant_spider/blackwidow
	name = "black widow spider"
	icon = 'icons/mob/cataclysm.dmi'
	desc = "Jet black and hairless, with an odd symbol on its hind."
	icon_state = "blackwidow_spider"
	icon_living = "blackwidow_spider"
	icon_dead = "blackwidow_spider_dead"
	gender = FEMALE
	faction = list("spiders")
	butcher_results = list(/obj/item/weapon/reagent_containers/food/snacks/meat/slab/spider = 2, /obj/item/weapon/reagent_containers/food/snacks/spiderleg = 8, /obj/item/weapon/reagent_containers/food/snacks/spidereggs = 2)
	maxHealth = 50
	speed = 2
	health = 50
	melee_damage_lower = 0
	melee_damage_upper = 10
	poison_per_bite = 7
	turns_per_move = 15 //should be VERY slow