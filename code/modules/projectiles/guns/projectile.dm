/obj/item/weapon/gun/projectile
	desc = "A classic revolver. Uses 357 ammo"
	name = "revolver"
	icon_state = "revolver"
	caliber = "357"
	origin_tech = "combat=2;materials=2"
	w_class = 3.0
	m_amt = 1000
	force = 7

	var
		ammo_type = "/obj/item/ammo_casing/a357"
		list/loaded = list()
		max_shells = 7
		load_method = 0 //0 = Single shells or quick loader, 1 = box, 2 = magazine
		obj/item/ammo_magazine/empty_mag = null

	proc
		animate_load()
			return

	New()
		..()
		for(var/i = 1, i <= max_shells, i++)
			loaded += new ammo_type(src)
		update_icon()
		return


	load_into_chamber()
		if(!loaded.len)	return 0

		var/obj/item/ammo_casing/AC = loaded[1] //load next casing.
		loaded -= AC //Remove casing from loaded list.
		AC.loc = get_turf(src) //Eject casing onto ground.

		if(AC.BB)
			in_chamber = AC.BB //Load projectile into chamber.
			AC.BB.loc = src //Set projectile loc to gun.
			return 1
		return 0


	attackby(var/obj/item/A as obj, mob/user as mob)

		var/num_loaded = 0
		if(istype(A, /obj/item/ammo_magazine))
			if((load_method == 2) && loaded.len)	return
			var/obj/item/ammo_magazine/AM = A
			for(var/obj/item/ammo_casing/AC in AM.stored_ammo)
				if(loaded.len >= max_shells)
					break
				if(AC.caliber == caliber && loaded.len < max_shells)
					AC.loc = src
					AM.stored_ammo -= AC
					AM.m_amt -= AC.m_amt //No more free ammo
					loaded += AC
					num_loaded++
			if(load_method == 2)
				user.remove_from_mob(AM)
				empty_mag = AM
				empty_mag.loc = src
			if(num_loaded)
				animate_load()
		if(istype(A, /obj/item/ammo_casing) && !load_method)
			var/obj/item/ammo_casing/AC = A
			if(AC.caliber == caliber && loaded.len < max_shells)
				user.drop_item()
				AC.loc = src
				loaded += AC
				num_loaded++
		if(num_loaded)
			user << text("\blue You load [] shell\s into the gun!", num_loaded)
		A.update_icon()
		update_icon()
		return


	update_icon()
		desc = initial(desc) + text(" Has [] rounds remaining.", loaded.len)
		return

//Point-blank shot

/obj/item/weapon/gun/projectile/attack(mob/living/carbon/human/M as mob, mob/living/carbon/human/user as mob)
	if ((user.zone_sel.selecting == "head") && (user.a_intent == "hurt") && istype(M,/mob/living/carbon/human) && caliber == "357")
		if (!load_into_chamber())
			user << "\red *click*";
			return
		playsound(user,'Gunshot.ogg',100,1)
		M.bullet_act(new/obj/item/projectile/bullet,"head")
		M.bullet_act(new/obj/item/projectile/bullet/weakbullet,"head")
		if (M == user)
			M.bullet_act(new/obj/item/projectile/bullet,"head")
		var/turf/location = M.loc
		if(istype(location,/turf/simulated))	location.add_blood(M)
	/*	if (user.gloves)	user.gloves.add_blood(M)
		else	user.add_blood(M)
		if (user.wear_suit)		user.wear_suit.add_blood(M)
		else	if (user.w_uniform)		user.w_uniform.add_blood(M)
		if (M.head)		M.head.add_blood(M)
		if (M.wear_mask)	M.wear_mask.add_blood(M)
		else if (M.glasses) M.glasses.add_blood(M) -- commented out as for now because the added blood appears to be uncleanable*/
		for(var/mob/O in viewers(M, null))
			if(O.client)
				O.show_message(text("\red <B>[] has been shot point-blank by []!</B>", M, user), 1, "\red You hear a gunshot", 2)
		M.attack_log += text("\[[time_stamp()]\]<font color='orange'> Has been shot point blank by [user.name] ([user.ckey]) with [src.name]</font>")
		user.attack_log += text("\[[time_stamp()]\]<font color='red'> Shot [M.name] ([M.ckey]) with [src.name] at point blank range.</font>")
		update_icon()
		return
	else
		..()