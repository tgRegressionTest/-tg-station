#ifdef AUTO_TEST

/auto_tester/proc/test_window_sealant()
	var/turf/simulated/floor/check1 = getLandmark("test_air_check1")
	var/turf/simulated/floor/check2 = getLandmark("test_air_check2")
	var/turf/simulated/floor/to_break = getLandmark("test_air_del")

	if(!istype(check1) || !istype(check2) || !istype(to_break))
		fail("Invalid or missing landmark 'test_air_*'.")
		return

	sleep(100)

	var/datum/gas_mixture/check1_air = check1.return_air()
	var/datum/gas_mixture/check2_air = check2.return_air()

	if(check1_air.oxygen != MOLES_O2STANDARD || check1_air.nitrogen != MOLES_N2STANDARD)
		fail("'check1' tile has bad starting air.")
		return
	if(check2_air.oxygen != MOLES_O2STANDARD || check2_air.nitrogen != MOLES_N2STANDARD)
		fail("'check2' tile has bad starting air.")
		return

	check1_air = null
	check2_air = null

	for(var/obj/structure/S in to_break)
		del(S)

	sleep(100)

	check1_air = check1.return_air()
	check2_air = check2.return_air()

	if(check1_air.oxygen == MOLES_O2STANDARD || check1_air.nitrogen == MOLES_N2STANDARD)
		fail("'check1' tile didn't leak.")
		return
	if(check2_air.oxygen == MOLES_O2STANDARD || check2_air.nitrogen == MOLES_N2STANDARD)
		fail("'check2' tile didn't leak.")
		return

	pass()
	return

#endif
