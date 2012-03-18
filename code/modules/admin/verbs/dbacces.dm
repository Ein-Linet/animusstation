/client/proc/edit_dbaccess()
	set category = "Debug"
	set name = "Edit DB Auth"

	//if(Debug2)
	if(!src.authenticated || !src.holder)
		src << "Only administrators may use this command."
		return

	sqldb = input("Enter database name:","DBName","[sqldb]") as text
	sqladdress = input("Enter database address:","DBAddress","[sqladdress]") as text
	sqlport = input("Enter database port:","DBPort","[sqlport]") as num
	sqllogin = input("Enter username:","DBLogin","[sqllogin]") as text
	sqlpass = input("Enter password:","DBPass","[sqlpass]") as text

/client/proc/update_sql_population()
	set category = "Debug"
	set name = "Update SQL Population"

	//if(Debug2)
	if(!src.authenticated || !src.holder)
		src << "Only administrators may use this command."
		return

	sql_update_population()
