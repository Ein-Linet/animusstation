/obj/item/projectile/bullet
	name = "bullet"
	icon_state = "bullet"
	damage = 60
	damage_type = BRUTE
	nodamage = 0
	flag = "bullet"


/obj/item/projectile/bullet/weakbullet
	damage = 10
	stun = 5
	weaken = 5


/obj/item/projectile/bullet/midbullet
	damage = 30
/*	stun = 5
	weaken = 5		// Nope, fuck you, nuke teams.
	eyeblur = 3		// Use the egun scrubs.
*/

/obj/item/projectile/bullet/c96_BRT
	damage = 40

/obj/item/projectile/bullet/c96_STN
	damage = 0
	nodamage = 1
	stun = 15
	weaken = 15

/obj/item/projectile/bullet/c96_EMP
	damage = 0
	nodamage = 1
	on_hit(var/atom/target, var/blocked = 0)
		empulse(target, -1, 0)
		return 1

/obj/item/projectile/bullet/suffocationbullet//How does this even work?
	name = "co bullet"
	damage = 20
	damage_type = OXY


/obj/item/projectile/bullet/cyanideround
	name = "poison bullet"
	damage = 40
	damage_type = TOX


/obj/item/projectile/bullet/burstbullet//I think this one needs something for the on hit
	name = "exploding bullet"
	damage = 20


/obj/item/projectile/bullet/stunshot
	name = "stunshot"
	damage = 5
	stun = 10
	weaken = 10
	stutter = 10


/obj/item/projectile/bullet/bolt
	name ="bolt"
	damage = 50
	pass_flags = PASSTABLE | PASSGLASS | PASSGRILLE | PASSWALL
	damage_type = BRUTE
	stutter = 5
	weaken = 5