#ifdef AUTO_TEST

/auto_tester
	var/current = ""
	var/logfile = null

/auto_tester/proc/pass(comment)
	logfile << "PASS: [current][comment ? " - [comment]" : ""]"
	return

/auto_tester/proc/fail(comment)
	logfile << "FAIL: [current][comment ? " - [comment]" : ""]"
	return

#endif
