/obj/item/weapon/gun/projectile/silenced
	name = "Silenced Pistol"
	desc = "A small, quiet,  easily concealable gun. Uses .45 rounds."
	icon_state = "silenced_pistol"
	w_class = 3.0
	max_shells = 12
	caliber = ".45"
	silenced = 1
	origin_tech = "combat=2;materials=2;syndicate=8"
	ammo_type = "/obj/item/ammo_casing/c45"



/obj/item/weapon/gun/projectile/deagle
	name = "Desert Eagle"
	desc = "A robust handgun that uses 357 magnum ammo"
	icon_state = "deagle"
	force = 14.0
	max_shells = 9



/obj/item/weapon/gun/projectile/deagle/gold
	name = "Desert Eagle"
	desc = "A gold plated gun folded over a million times by superior martian gunsmiths. Uses 357 ammo."
	icon_state = "deagleg"
	item_state = "deagleg"



/obj/item/weapon/gun/projectile/deagle/camo
	name = "Desert Eagle"
	desc = "A Deagle brand Deagle for operators operating operationally. Uses 357 ammo."
	icon_state = "deaglecamo"
	item_state = "deagleg"



/obj/item/weapon/gun/projectile/gyropistol
	name = "Gyrojet Pistol"
	desc = "A bulky pistol designed to fire self propelled rounds"
	icon_state = "gyropistol"
	max_shells = 8
	caliber = "a75"
	fire_sound = 'Explosion1.ogg'
	origin_tech = "combat=3"
	ammo_type = "/obj/item/ammo_casing/a75"


/obj/item/weapon/gun/projectile/c96
	name = "Mauser C96"
	desc = "An antique pistol that uses 7.63mm ammo"
	icon_state = "c96"
	origin_tech = "combat=4;materials=3"
	load_method = 0 //0 = single shells or quick loader
	force = 14.0
	max_shells = 10
	ammo_type = "/obj/item/ammo_casing/a763mm"
	caliber = "7.63mm"

	animate_load()
		icon_state = "c96load"
		spawn(15) icon_state = "c96"

/obj/item/weapon/gun/projectile/c96/stun
	ammo_type = "/obj/item/ammo_casing/a763mm_stun"