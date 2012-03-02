/client/proc/deb_check_reagents(obj/O as obj in world)
	set category = null
	set name = "Check Reagents"

	if(!authenticated || !holder)
		src << "Only administrators may use this command."
		return
	switch(alert("What do you want?",,"View Reagents","Add Reagent","Create Holder"))
		if("View Reagents")
			deb_view_reagents(O)
			return
		if("Add Reagent")
			deb_add_reagent(O)
			return
		if("Create Holder")
			deb_create_holder_datum(O)
			return
	return


/client/proc/deb_view_reagents(obj/O as obj in world)
	set category = null
	set name = "View Reagents"

	if(!authenticated || !holder)
		src << "Only administrators may use this command."
		return
	if(!O.reagents || !istype(O.reagents, /datum/reagents))
		usr << "There is no reagents datum."
		return
	var/datum/reagents/Holder = O.reagents
	usr << "Reagents of [O.name]:"
	usr << "Max Volume = [Holder.maximum_volume]"
	usr << "Total Volume = [Holder.total_volume]"
	usr << "Reagents:"
	for(var/datum/reagent/R in Holder.reagent_list)
		usr << "[R.name] ([R.id]) = [R.volume]"
	usr << "End"
	return

/client/proc/deb_add_reagent(obj/O as obj in world)
	set category = null
	set name = "Add Reagent"

	if(!authenticated || !holder)
		src << "Only administrators may use this command."
		return
	if(!O.reagents || !istype(O.reagents, /datum/reagents))
		usr << "There is no reagents datum."
		return
	var/datum/reagents/Holder = O.reagents
	var/free_vol = Holder.maximum_volume - Holder.total_volume
	var/new_reag_id = input(usr, "What reagent do you wish to add?", "New Reagent ID", "adminordrazine")
	var/new_reag_volume = input(usr, "How much [new_reag_id] do you want to add in? ([free_vol] max)", "Volume", free_vol)
	if(!new_reag_id || !new_reag_volume || (new_reag_volume > free_vol) || new_reag_id == "")
		usr << "Wrong params!"
		return
	if(Holder.add_reagent(new_reag_id, new_reag_volume))
		usr << "Something goes wrong. Are you enter correct ID?"
		return
	usr << "[new_reag_volume] units of [new_reag_id] was added to the [O.name]."
	return

/client/proc/deb_create_holder_datum(obj/O as obj in world)
	set category = null
	set name = "Create Reagents Holder Datum"

	if(!authenticated || !holder)
		src << "Only administrators may use this command."
		return
	if(O.reagents && istype(O.reagents, /datum/reagents) && alert("Delete old holder?",,"Yes","No")=="No")
		if(alert("Delete old holder?",,"Yes","No")=="No")
			return
		else
			del O.reagents
	var/new_max_vol = input(usr, "Enter max vol.", "Volume", 50)
	if(new_max_vol <= 0)
		usr << "Too small volume!"
		return
	var/datum/reagents/R = new/datum/reagents(new_max_vol)
	O.reagents = R
	R.my_atom = O
	usr << "New reagents holder with max vol = [new_max_vol] was assigned to the [O.name]."
	return
