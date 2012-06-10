(batch* "test-env2.clp")

(reset)

(checkComplainAndAdjustExpected 0)

(test TRUE)
(if FALSE then (test FALSE))

(checkComplainAndAdjustExpected 1)

(printout t "result: " (result) crlf)
