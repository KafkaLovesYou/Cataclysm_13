//Fallout 13 decorative derelict vehicles directory

/obj/structure/car
	name = "broken car"
	desc = "A rusty automobile carcass.<br>This car is damaged beyond repair."
	icon = 'icons/fallout/vehicles/medium_vehicles.dmi'
	icon_state = "derelict"
	anchored = 1
	density = 1
	layer = ABOVE_MOB_LAYER
	resistance_flags = INDESTRUCTIBLE

/obj/structure/car/New()
	..()
	if(prob(50))
		icon_state = "derelict2"
	dir = pick("1","2","4","5","6","8","9","10")

	var/atom/movable/S = new (locate(x+1,y,z))
	S.density = 1
	S.anchored = 1
	S.icon = null
	S.verbs.Cut()