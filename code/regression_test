proc/regression_testing()
	human_survival()
	alien_survival()

proc/human_survival()
	var/mob/living/carbon/human/H = new /mob/living/carbon/human(locate(128, 128, 1))
	sleep(100)
	if(H.stat == DEAD)
		CRASH("FAIL: dead human")
	else
		CRASH("PASS")

proc/alien_survival()
	var/mob/living/carbon/alien/humanoid/drone/A = new /mob/living/carbon/alien/humanoid/drone(locate(128, 128, 1))
	sleep(100)
	if(A.stat == DEAD)
		CRASH("FAIL: dead alien")
	else
		CRASH("PASS")
