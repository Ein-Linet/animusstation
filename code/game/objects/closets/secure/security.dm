/obj/structure/closet/secure_closet/captains
	name = "Captain's Closet"
	req_access = list(access_captain)
	icon_state = "capsecure1"
	icon_closed = "capsecure"
	icon_locked = "capsecure1"
	icon_opened = "capsecureopen"
	icon_broken = "capsecurebroken"
	icon_off = "capsecureoff"

	New()
		..()
		sleep(2)
		new /obj/item/clothing/suit/captunic(src)
		new /obj/item/clothing/head/helmet/cap(src)
		new /obj/item/clothing/under/rank/captain(src)
		new /obj/item/clothing/suit/armor/vest(src)
		new /obj/item/weapon/cartridge/captain(src)
		new /obj/item/clothing/gloves/captain(src)
		new /obj/item/clothing/head/helmet/swat(src)
		new /obj/item/clothing/shoes/brown(src)
		new /obj/item/device/radio/headset/heads/captain(src)
		new /obj/item/weapon/reagent_containers/food/drinks/flask(src)
		new /obj/item/weapon/gun/energy/gun(src)
		return



/obj/structure/closet/secure_closet/hop
	name = "Head of Personnel"
	req_access = list(access_hop)


	New()
		..()
		sleep(2)
		new /obj/item/clothing/under/rank/head_of_personnel(src)
		new /obj/item/clothing/suit/armor/vest(src)
		new /obj/item/clothing/head/helmet(src)
		new /obj/item/weapon/cartridge/hop(src)
		new /obj/item/device/radio/headset/heads/hop(src)
		new /obj/item/clothing/shoes/brown(src)
		new /obj/item/weapon/storage/id_kit(src)
		new /obj/item/weapon/storage/id_kit( src )
		new /obj/item/weapon/gun/energy/gun(src)
		new /obj/item/device/flash(src)
		new /obj/item/clothing/glasses/sunglasses(src)
		return



/obj/structure/closet/secure_closet/hos
	name = "Head Of Security"
	req_access = list(access_hos)
	icon_state = "hossecure1"
	icon_closed = "hossecure"
	icon_locked = "hossecure1"
	icon_opened = "hossecureopen"
	icon_broken = "hossecurebroken"
	icon_off = "hossecureoff"

	New()
		..()
		sleep(2)
		new /obj/item/clothing/suit/armor/vest(src)
		new /obj/item/clothing/under/jensen(src)
		new /obj/item/clothing/suit/armor/hos/jensen(src)
		new /obj/item/clothing/head/helmet/HoS/dermal(src)
		new /obj/item/weapon/cartridge/hos(src)
		new /obj/item/device/radio/headset/heads/hos(src)
		new /obj/item/clothing/glasses/sunglasses/sechud(src)
		new /obj/item/weapon/shield/riot(src)
		new /obj/item/weapon/storage/flashbang_kit(src)
		new /obj/item/weapon/storage/lockbox/loyalty(src)
		new /obj/item/weapon/melee/baton(src)
		new /obj/item/weapon/gun/energy/gun(src)
		new /obj/item/device/flash(src)
		new /obj/item/weapon/storage/belt/security(src)
		return



/obj/structure/closet/secure_closet/warden
	name = "Warden's Locker"
	req_access = list(access_armory)
	icon_state = "wardensecure1"
	icon_closed = "wardensecure"
	icon_locked = "wardensecure1"
	icon_opened = "wardensecureopen"
	icon_broken = "wardensecurebroken"
	icon_off = "wardensecureoff"


	New()
		..()
		sleep(2)
		new /obj/item/clothing/under/rank/warden(src)
		new /obj/item/clothing/suit/armor/vest(src)
		new /obj/item/clothing/head/helmet/warden(src)
		new /obj/item/weapon/cartridge/security(src)
		new /obj/item/device/radio/headset/headset_sec(src)
		new /obj/item/weapon/storage/flashbang_kit(src)
		new /obj/item/weapon/pepperspray(src)
		new /obj/item/weapon/storage/belt/security(src)
		new /obj/item/weapon/melee/baton(src)
		new /obj/item/weapon/gun/energy/taser(src)
		new /obj/item/clothing/glasses/sunglasses/sechud(src)
		return



/obj/structure/closet/secure_closet/security
	name = "Security Locker"
	req_access = list(access_security)
	icon_state = "sec1"
	icon_closed = "sec"
	icon_locked = "sec1"
	icon_opened = "secopen"
	icon_broken = "secbroken"
	icon_off = "secoff"

	New()
		..()
		sleep(2)
		new /obj/item/weapon/storage/backpack/security(src)
		new /obj/item/clothing/suit/armor/vest(src)
		new /obj/item/clothing/head/helmet(src)
		new /obj/item/weapon/cartridge/security(src)
		new /obj/item/device/radio/headset/headset_sec(src)
		new /obj/item/weapon/storage/belt/security(src)
		new /obj/item/weapon/flashbang(src)
		new /obj/item/weapon/pepperspray(src)
		new /obj/item/device/flash(src)
		new /obj/item/weapon/melee/baton(src)
		new /obj/item/weapon/gun/energy/taser(src)
		new /obj/item/clothing/glasses/sunglasses/sechud(src)
		return



/obj/structure/closet/secure_closet/detective
	name = "Detective"
	req_access = list(access_forensics_lockers)
	icon_state = "cabinetdetective_locked"
	icon_closed = "cabinetdetective"
	icon_locked = "cabinetdetective_locked"
	icon_opened = "cabinetdetective_open"
	icon_broken = "cabinetdetective_broken"
	icon_off = "cabinetdetective_broken"

	New()
		..()
		sleep(2)
		new /obj/item/clothing/under/det(src)
		new /obj/item/clothing/suit/det_suit/armor(src)
		new /obj/item/clothing/suit/det_suit(src)
		new /obj/item/clothing/gloves/black(src)
		new /obj/item/clothing/head/det_hat(src)
		new /obj/item/clothing/shoes/brown(src)
		new /obj/item/device/radio/headset/headset_sec(src)
		new /obj/item/weapon/cartridge/detective(src)
		new /obj/item/weapon/storage/fcard_kit(src)
		new /obj/item/weapon/fcardholder(src)
		new /obj/item/weapon/clipboard(src)
		return



/obj/structure/closet/secure_closet/injection
	name = "Lethal Injections"
	req_access = list(access_hos)


	New()
		..()
		sleep(2)
		new /obj/item/weapon/reagent_containers/ld50_syringe/choral(src)
		new /obj/item/weapon/reagent_containers/ld50_syringe/choral(src)
		return



/obj/structure/closet/secure_closet/brig
	name = "Brig Locker"
	req_access = list(access_brig)
	anchored = 1
	var/id = null

	New()
		new /obj/item/clothing/under/color/orange( src )
		new /obj/item/clothing/shoes/orange( src )
		return



/obj/structure/closet/secure_closet/courtroom
	name = "Courtroom Locker"
	req_access = list(access_court)

	New()
		..()
		sleep(2)
		new /obj/item/clothing/shoes/brown(src)
		new /obj/item/weapon/paper/Court (src)
		new /obj/item/weapon/paper/Court (src)
		new /obj/item/weapon/paper/Court (src)
		new /obj/item/weapon/pen (src)
		new /obj/item/clothing/suit/judgerobe (src)
		new /obj/item/clothing/head/powdered_wig (src)
		new /obj/item/weapon/storage/briefcase(src)
		return
