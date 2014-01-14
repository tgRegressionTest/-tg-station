#ifdef AUTO_TEST

/auto_test/proc/test_human_survival()
	var/mob/living/carbon/human/H = new /mob/living/carbon/human(locate(world.maxx/2, world.maxy/2, 1))
	sleep(100)
	if(H.stat == 2)
		fail("Dead human.")
	else
		pass()

/auto_test/proc/test_alien_survival()
	var/mob/living/carbon/alien/humanoid/drone/A = new /mob/living/carbon/alien/humanoid/drone(locate(world.maxx/2, world.maxy/2, 1))
	sleep(100)
	if(A.stat == 2)
		fail("Dead alien.")
	else
		pass()

#endif AUTO_TEST
