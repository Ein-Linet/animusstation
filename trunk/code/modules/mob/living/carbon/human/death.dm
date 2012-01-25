/mob/living/carbon/human/death(gibbed)
	if(src.stat == 2)
		return
	if(src.healths)
		src.healths.icon_state = "health5"
	src.stat = 2
	src.dizziness = 0
	src.jitteriness = 0

	tension_master.death(src)

	if (!gibbed)
		emote("deathgasp") //let the world KNOW WE ARE DEAD

		//For ninjas exploding when they die./N
		if (istype(wear_suit, /obj/item/clothing/suit/space/space_ninja)&&wear_suit:s_initialized)
			src << browse(null, "window=spideros")//Just in case.
			var/location = loc
			explosion(location, 1, 2, 3, 4)

		canmove = 0
		if(src.client)
			src.blind.layer = 0
		lying = 1
		var/h = src.hand
		hand = 0
		drop_item()
		hand = 1
		drop_item()
		hand = h
		//This is where the suicide assemblies checks would go

		if (client)
			spawn(10)
				if(client && src.stat == 2)
					verbs += /mob/proc/ghost

	var/tod = time2text(world.realtime,"hh:mm:ss") //weasellos time of death patch
	if(mind)
		mind.store_memory("Time of death: [tod]", 0)
	sql_report_death(src)

	//Calls the rounds wincheck, mainly for wizard, malf, and changeling now
	ticker.mode.check_win()
	//Traitor's dead! Oh no!
	if (ticker.mode.name == "traitor" && src.mind && src.mind.special_role == "traitor")
		message_admins("\red Traitor [key_name_admin(src)] has died.")
		log_game("Traitor [key_name(src)] has died.")

	return ..(gibbed)

/mob/living/carbon/human/proc/ChangeToHusk()
	if(mutations & HUSK)
		return
	mutations |= HUSK
	real_name = "Unknown"
	update_body()
	return