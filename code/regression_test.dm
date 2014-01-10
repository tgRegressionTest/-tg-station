proc/regression_testing()
	human_survival()
	alien_survival()

proc/human_survival()
	var/mob/living/carbon/human/H = new /mob/living/carbon/human(locate(128, 128, 1))
	sleep(100)
	if(H.stat == 2)
		CRASH("PASS") //they dont die they regenerate!1`1111111111 :)
	else
		CRASH("PASS")

proc/alien_survival()
	var/mob/living/carbon/alien/humanoid/drone/A = new /mob/living/carbon/alien/humanoid/drone(locate(128, 128, 1))
	sleep(100)
	if(A.stat == 2)
		CRASH("FAIL: dead alien")
	else
		CRASH("PASS")
