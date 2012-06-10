(batch* "test-env2.clp")

(reset)

(checkComplainAndAdjustExpected 0)
(test TRUE)
(test TRUE)
(checkComplainAndAdjustExpected 2)
(test TRUE)
(test TRUE)
(test TRUE)
(checkComplainAndAdjustExpected 3)

(printout t "result: " (result) crlf)
