/obj/item/weapon/cureimplanter
	name = "Hypospray injector"
	icon = 'items.dmi'
	icon_state = "implanter1"
	var/resistance = 0
	var/works = 0
	var/datum/disease2/disease/virus2 = null
	item_state = "syringe_0"
	throw_speed = 1
	throw_range = 5
	w_class = 2.0


/obj/item/weapon/cureimplanter/attack(mob/target as mob, mob/user as mob)
	if(ismob(target))
		for(var/mob/O in viewers(world.view, user))
			if (target != user)
				O.show_message(text("\red <B>[] is trying to inject [] with [src.name]!</B>", user, target), 1)
			else
				O.show_message("\red <B>[user] is trying to inject themselves with [src.name]!</B>", 1)
		if(!do_mob(user, target,60)) return


		for(var/mob/O in viewers(world.view, user))
			if (target != user)
				O.show_message(text("\red [] injects [] with [src.name]!", user, target), 1)
			else
				O.show_message("\red [user] injects themself with [src.name]!", 1)


		var/mob/living/carbon/M = target

		if(works == 0)
			if(!M.resistances2.Find(resistance))
				M.resistances2 += resistance
			if(M.virus2)
				if(M.resistances2.Find(M.virus2.uniqueID))
					M.virus2.dead=1
		else if(works == 1)
			M.toxloss += rand(20,80)
		else if(works == 2)
			M.gib()
		else if(works == 3)
			infect_virus2(M,virus2,1)