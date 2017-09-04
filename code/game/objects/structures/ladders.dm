/obj/structure/ladder
	name = "ladder"
	desc = "A metal ladder."
	icon = 'icons/fallout/objects/structures/stationary.dmi'
	icon_state = "ladder_middle"
	anchored = 1
	resistance_flags = INDESTRUCTIBLE
	var/id = null
	var/height = 0							//the 'height' of the ladder. higher numbers are considered physically higher
	var/obj/structure/ladder/down = null	//the ladder below this one
	var/obj/structure/ladder/up = null		//the ladder above this one
	var/opened = TRUE						//if the "associated hatch" is open or not, mostly used for manholes

/obj/structure/ladder/unbreakable //mostly useful for awaymissions to prevent halting progress in a mission
	name = "ladder"
	desc = "An sturdy metal ladder."



/obj/structure/ladder/unbreakable/stairs
	name = "staircase"
	icon_state = "stairs"
	desc = ""
	//density = 1

/obj/structure/ladder/unbreakable/stairs/New()
	if(up && down)
		desc = "(Click to walk up or down)"
	else if(up)
		desc = "(Click to walk up)"
	else if(down)
		desc = "(Click to walk down)"
	else
		desc = "Looks like it's broken."
/obj/structure/ladder/unbreakable/stairs/update_icon() //so we don't botch our icons
	return

/obj/structure/ladder/unbreakable/manhole
	name = "manhole"
	opened = FALSE
	icon_state = "manhole_c"

/obj/structure/ladder/unbreakable/manhole/update_icon()
	if(opened)
		icon_state = "manhole_o"
	else
		icon_state = "manhole_c"

/obj/structure/ladder/unbreakable/manhole/attackby(obj/item/weapon/W, mob/user, params)
	if(istype(/obj/item/weapon/crowbar, W))
		if(opened)
			to_chat(user, "<span class='notice'>You close the cover of \the [src].</span>")
		else if(!opened)
			to_chat(user, "<span class='notice'>You open the cover of \the [src].</span>")
		opened = !opened
		src.update_icon()
	else
		if(opened)
			if(up)
				if(up.opened)
					return attack_hand(user)
				else
					to_chat(user, "<span class='notice'>\The manhole is covered.</span>")
			else
				return attack_hand(user)
		else
			to_chat(user, "<span class='notice'>\The manhole is covered.</span>")



/obj/structure/ladder/initialize()
	spawn(120)
		for(var/obj/structure/ladder/L in world)
			if(L.id == id)
				if(L.height == (height - 1))
					down = L
					continue
				if(L.height == (height + 1))
					up = L
					continue

			if(up && down)	//if both our connections are filled
				break
		update_icon()

/obj/structure/ladder/update_icon()
	if(up && down)
		icon_state = "ladder_middle"

	else if(up)
		icon_state = "ladder_bottom"

	else if(down)
		icon_state = "ladder_top"

	else	//wtf make your ladders properly assholes
		icon_state = "ladder_dmg"

/obj/structure/ladder/proc/go_up(mob/user,is_ghost)
	if(!is_ghost)
		show_fluff_message(1,user)
		up.add_fingerprint(user)
	user.forceMove(get_turf(up))

/obj/structure/ladder/proc/go_down(mob/user,is_ghost)
	if(!is_ghost)
		show_fluff_message(0,user)
		down.add_fingerprint(user)
	user.forceMove(get_turf(down))

/obj/structure/ladder/proc/use(mob/user,is_ghost=0)
	if(up && down)
		switch( alert("Go up or down \the [src]?", "[src]", "Up", "Down", "Cancel") )
			if("Up")
				if(up.opened && opened) //continually checking if the associated manhole is uncovered
					go_up(user,is_ghost)
				else if (!opened)
					to_chat(user, "<span class='notice'>\The manhole is covered.</span>")
				else
					to_chat(user, "<span class='notice'>\The manhole above is covered.</span>")
			if("Down")
				if(down.opened && opened)
					go_down(user,is_ghost)
				else if (!opened)
					to_chat(user, "<span class='notice'>\The manhole is covered.</span>")
				else
					to_chat(user, "<span class='notice'>\The manhole below is covered.</span>")
			if("Cancel")
				return
	else if(up)
		if(up.opened && opened)
			go_up(user,is_ghost)
		else if (!opened)
			to_chat(user, "<span class='notice'>\The manhole is covered.</span>")
		else
			to_chat(user, "<span class='notice'>\The manhole above is covered.</span>")
	else if(down)
		if(down.opened && opened)
			go_down(user,is_ghost)
		else if (!opened)
			to_chat(user, "<span class='notice'>\The manhole is covered.</span>")
		else
			to_chat(user, "<span class='notice'>\The manhole below is covered.</span>")
	else
		to_chat(user, "<span class='warning'>[src] doesn't seem to lead anywhere!</span>")

	if(!is_ghost)
		add_fingerprint(user)

/obj/structure/ladder/MouseDrop_T(atom/movable/M, mob/living/user)
	. = ..()
	if(user.restrained() || user.stat || !in_range(user, src) || M == src)
		return 0
	add_fingerprint(user)
	user.visible_message("[user] moved [M] by \the [src].","<span class='notice'>You move [M] to \the [src].</span>")
	to_chat(M, "You moved to [src] by [user].")
	use(M)

/obj/structure/ladder/attack_hand(mob/user)
	if(can_use(user))
		use(user)

/obj/structure/ladder/attack_paw(mob/user)
	return attack_hand(user)

/obj/structure/ladder/attackby(obj/item/weapon/W, mob/user, params)
	return attack_hand(user)

/obj/structure/ladder/attack_ghost(mob/dead/observer/user)
	use(user,1)

/obj/structure/ladder/proc/show_fluff_message(up,mob/user)
	if(up)
		user.visible_message("[user] climbs up \the [src].","<span class='notice'>You climb up \the [src].</span>")
	else
		user.visible_message("[user] climbs down \the [src].","<span class='notice'>You climb down \the [src].</span>")

/obj/structure/ladder/proc/can_use(mob/user)
	return 1

/obj/structure/ladder/unbreakable/Destroy(force)
	if(force)
		. = ..()
	else
		return QDEL_HINT_LETMELIVE
