#ifdef AUTO_TEST

/var/running_tests = 0

/proc/runAutoTests()
	if(MAP_FILE != "autotestmap.dmm")
		CRASH("Wrong map compiled in for automatic testing.  Did you compile with -Mautotestmap?")

	var/logfile = file("test_results.log")

	for(var/p in typesof(/auto_tester/proc))
		if(findtext("[p]", "proc/test_"))
			var/auto_tester/tester = new
			tester.logfile = logfile
			tester.current = "[p]"
			running_tests++
			spawn
				call(tester, p)()
				running_tests--

	while(running_tests > 0)
		sleep(20) //wait a bit, then check again.

	return

#endif
