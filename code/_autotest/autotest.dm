#ifdef AUTO_TEST

/auto_test
	var/testing = ""
	var/logfile = null

/auto_test/proc/pass(var/comment)
	logfile << "PASS: [testing][comment ? " - [comment]" : ""]"
	return

/auto_test/proc/fail(var/comment)
	logfile << "FAIL: [testing][comment ? " - [comment]" : ""]"
	return

/proc/runAutoTests()
	var/auto_test/tester = new

	tester.logfile = file("test_results.log")

	for(var/p in typesof(/auto_test/proc))
		if(findtext("[p]", "proc/test_"))
			tester.testing = "[p]"
			call(tester, p)()

#endif
