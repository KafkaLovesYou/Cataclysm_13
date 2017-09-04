/obj/item/zombie_pheromone
	name = "zombie pheromone"
	icon_state = "gland"
	desc = " This is some kind of disgusting ball of rotting meat.<br>Squeezing it causes a small cloud of pheromones to spray into the air, causing nearby zombies to become friendly for a short period of time."
	icon = 'icons/obj/abductor.dmi'
	force = 1
	w_class = WEIGHT_CLASS_SMALL
	throwforce = 0
	throw_speed = 3
	throw_range = 6
	origin_tech = "biotech=3"
	hitsound = 'sound/weapons/Genhit.ogg'
	attack_verb = list("slapped")
	resistance_flags = ACID_PROOF
	var/last_for = 0
	var/activated = FALSE

/obj/item/zombie_pheromone/New()
	..()
	icon_state = pick("gland","slime","health","species")
	last_for = rand(200,600) //how long does the pheromone effect last, from 20 seconds up to a minute
	pixel_x = rand(-6, 6)	//Randomizes postion slightly.
	pixel_y = rand(-6, 6)

/obj/item/zombie_pheromone/attack_self(mob/user)
	if(activated)
		to_chat(user, "<span class='warning'>This [src] is already spent!</span>")
	else
		activated = TRUE
		var/myName = name
		name = "activated [name]"
		to_chat(user, "<span class='notice'>You squeeze \the [src], producing a foul smelling cloud of pheromones around you.</span>")
		playsound(src.loc, 'sound/effects/splat.ogg', 50, 1)
		user.faction += list("ghoul") 			 //add ghoul faction
		spawn(last_for) 						 //wait a bit
			user.faction -= list("ghoul")		 //remove ghoul faction
			name = "used [myName]"
