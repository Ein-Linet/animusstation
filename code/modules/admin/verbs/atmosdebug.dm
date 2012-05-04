var/show_atmo_time = 0

/client/proc/atmosscan()
	set category = "Mapping"
	set name = "Check Plumbing"
	if(!src.holder)
		src << "Only administrators may use this command."
		return
	feedback_add_details("admin_verb","CP") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

	//all plumbing - yes, some things might get stated twice, doesn't matter.
	for (var/obj/machinery/atmospherics/plumbing in world)
		if (plumbing.nodealert)
			usr << "Unconnected [plumbing.name] located at [plumbing.x],[plumbing.y],[plumbing.z] ([get_area(plumbing.loc)])"

	//Manifolds
	for (var/obj/machinery/atmospherics/pipe/manifold/pipe in world)
		if (!pipe.node1 || !pipe.node2 || !pipe.node3)
			usr << "Unconnected [pipe.name] located at [pipe.x],[pipe.y],[pipe.z] ([get_area(pipe.loc)])"

	//Pipes
	for (var/obj/machinery/atmospherics/pipe/simple/pipe in world)
		if (!pipe.node1 || !pipe.node2)
			usr << "Unconnected [pipe.name] located at [pipe.x],[pipe.y],[pipe.z] ([get_area(pipe.loc)])"

/client/proc/toggle_atmopipe()
	set category = "Debug"
	set name = "Show atmo timing"
	show_atmo_time = !show_atmo_time
	usr << "Show_atmo_time is now [show_atmo_time ? "On" : "Off"]"

/client/proc/delete_atmopipes()
	set category = "Debug"
	set name = "Delete Pipes"
	if(!src.holder)
		src << "Only administrators may use this command."
		return
	if(alert("Are you REALLY sure you want to delete all pipes in world? It's irreversible.","YOU ARE AN IDIOT?", "Yes", "No")=="Yes")
		log_admin("[key_name(usr)] uses delete_atmopipes button")
		message_admins("[key_name_admin(usr)] clicked on delete_atmopipes! Prepare to LAAAAAAAAGS", 1)
		for(var/obj/machinery/meter/M in world)
			del(M)
		for(var/obj/machinery/atmospherics/A in world)
			del(A)

/client/proc/powerdebug()
	set category = "Mapping"
	set name = "Check Power"
	if(!src.holder)
		src << "Only administrators may use this command."
		return
	feedback_add_details("admin_verb","CPOW") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

	for (var/datum/powernet/PN in powernets)
		if (!PN.nodes || !PN.nodes.len)
			if(PN.cables && (PN.cables.len > 1))
				var/obj/structure/cable/C = PN.cables[1]
				usr << "Powernet with no nodes! (number [PN.number]) - example cable at [C.x], [C.y], [C.z] in area [get_area(C.loc)]"

		if (!PN.cables || (PN.cables.len < 10))
			if(PN.cables && (PN.cables.len > 1))
				var/obj/structure/cable/C = PN.cables[1]
				usr << "Powernet with fewer than 10 cables! (number [PN.number]) - example cable at [C.x], [C.y], [C.z] in area [get_area(C.loc)]"