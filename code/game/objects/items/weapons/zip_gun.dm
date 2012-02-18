/obj/item/weapon/zip_gun
	name = "zip gun"
	icon = 'zip_gun.dmi'
	icon_state = "zip_gun1"
	item_state = "zip_gun1"
	desc = "A wooden frame for a home-made gun."
	flags = FPRINT | TABLEPASS| CONDUCT
	force = 5.0
	throwforce = 3.0
	throw_speed = 1
	throw_range = 5
	w_class = 3.0

	attackby(var/obj/item/item as obj, var/mob/user as mob)
		if((item_state == "zip_gun1") && istype(item, /obj/item/pipe))
			if (item:pipe_type != 0)
				user << "This pipe will not fit in here."
			else
				item_state = "zip_gun2"
				icon_state = "zip_gun2"
				update_icon()
				user << "You attach a pipe to the wooden frame."
				desc = "A strange assembly of a wooden frame and a pipe."
				del item
			return
		if((item_state == "zip_gun2") && istype(item, /obj/item/weapon/cable_coil))
			if (item:amount < 5)
				user << "You need more wires."
			else
				item:amount -= 5
				item:update_icon()
				user << "You bind the frame and the pipe together with wires."
				item_state = "zip_gun3"
				icon_state = "zip_gun3"
				desc = "A strange assembly of a wooden frame and a pipe bound to it with wires."
				update_icon()
			return
		if((item_state == "zip_gun3") && istype(item, /obj/item/device/assembly/igniter))
			if (item:secured == 1)
				user << "\red The ingiter is secured, it cannot be attached."
			else
				item_state = "zip_gun4"
				icon_state = "zip_gun4"
				update_icon()
				user << "You attach the igniter to the frame."
				desc = "A strange assembly of a wooden frame, a pipe bound to it with wires and an igniter attached."
				del item
			return
		if((item_state == "zip_gun4") && istype(item, /obj/item/stack/rods))
			if (item:amount < 2)
				user << "You need at least two rods to do this."
			else
/*				item_state = "zip_gun"
				icon_state = "zip_gun"
				update_icon()*/
				item:use(2)
				user << "You add some rods, finishing the gun."
				new /obj/item/weapon/gun/projectile/zip_gun(get_turf(loc))
				del src
			return
		else
			..()

/obj/item/weapon/gun/projectile/zip_gun
	name = "zip gun"
	icon = 'zip_gun.dmi'
	icon_state = "zip_gun"
	desc = "A piece of pipe attacthed to a wooden frame. Does this even shoot? "
	flags = FPRINT | TABLEPASS| CONDUCT | ONBELT | USEDELAY
	force = 5.0
	throwforce = 7.0
	origin_tech = "combat=3"
	caliber = "zip_gun"
	ammo_type = "/obj/item/ammo_casing/zip_gun"
	max_shells = 1

	var/match = 0
	var/glass = 0

	attackby(var/obj/item/item as obj, var/mob/user as mob)
		if (istype(item, /obj/item/weapon/matchbox))
			if (match == 0)
				user << "You load a matchbox into the zip gun."
				match = 1
				del item
			else
				user << "You've already loaded a matchbox."
			return
		if (istype(item, /obj/item/weapon/shard))
			if (match == 0)
				user << "Add a matchbox first."
			else
				if (glass == 0)
					user << "You crush the shard and load pieces into the gun."
					glass = 1
					del item
				else
					user << "There's already shard pieces loaded."
			return

	special_check()
		if (match && glass)
			if(prob(15))
				usr << "\red The gun blows up in your face!"
				explosion(usr.loc,-1,-1,1,1)
				del src
				return
			match = 0
			glass = 0
			loaded += new ammo_type(src)
			return 1
		else
			usr << "\red *click*"
			return 0

/obj/item/ammo_casing/zip_gun
	desc = "A zip gun bullet casing."
	caliber = "zip_gun"
	projectile_type = "/obj/item/projectile/bullet/zip_gun"

/obj/item/projectile/bullet/zip_gun
	damage = 30
	stun = 5
	weaken = 5
	eyeblur = 3

/*To do:
-fix bullet casings
-display remaining rounds properly
*/