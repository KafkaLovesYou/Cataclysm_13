/obj/item/weapon/lock_construct
	name = "lock"
	desc = "a crude but useful lock and bolt."
	icon = 'icons/fallout/objects/storage.dmi'
	icon_state = "locktest"
	w_class = WEIGHT_CLASS_TINY
	var/lock_data
	var/ispaired

/obj/item/weapon/lock_construct/New()
	..()
	force = 0
	throwforce = 0
	//lock_data = generateRandomString(round(material.integrity/50))
	lock_data = generateRandomString(10)
	ispaired = 0

/obj/item/weapon/lock_construct/attackby(var/obj/item/I, var/mob/user)
	if(istype(I,/obj/item/weapon/key))
		var/obj/item/weapon/key/K = I
		if(ispaired == 0 && K.key_data == "")
			to_chat(user, "<span class='notice'>You pair \the [I] and \the [src]</span>")
			K.key_data = lock_data
			ispaired = 1
		else
			if (K.key_data != lock_data)
				to_chat(user, "<span class='warning'>\The [I] doesn't fit.</span>")
			else
				to_chat(user, "<span class='notice'>\The [I] fits!</span>")
		return
	if(istype(I,/obj/item/weapon/lock_construct))
		var/obj/item/weapon/lock_construct/L = I
		src.lock_data = L.lock_data
		to_chat(user, "<span class='notice'>You copy the lock from \the [L] to \the [src], making them identical.</span>")
		return
	..()

/obj/item/weapon/lock_construct/proc/create_lock(var/atom/target, var/mob/user)
	. = new /datum/lock(target,lock_data)
	user.drop_item(src)
	user.visible_message("\The [user] attaches \the [src] to \the [target]")
	qdel(src)