#ifdef AUTO_TEST

//Survival tests

/auto_tester/proc/test_human_survival()
	var/turf/T = getLandmark("test_life_safe")
	if(!istype(T))
		fail("Invalid or missing landmark 'test_life_safe'.")
		return

	var/mob/living/carbon/human/H = new /mob/living/carbon/human(T)

	sleep(100)

	if(H.stat == 2 || H.health != H.maxHealth)
		fail("Dead human.")
		return
	else
		pass()
		return

/auto_tester/proc/test_alien_survival()
	var/turf/T = getLandmark("test_life_safe")
	if(!istype(T))
		fail("Invalid or missing landmark 'test_life_safe'.")
		return

	var/mob/living/carbon/alien/humanoid/drone/A = new /mob/living/carbon/alien/humanoid/drone(T)

	sleep(100)

	if(A.stat == 2 || A.health != A.maxHealth)
		fail("Dead alien.")
		return
	else
		pass()
		return

#endif AUTO_TEST
