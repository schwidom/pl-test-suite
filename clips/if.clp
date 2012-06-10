(batch* "test-env2.clp")

(reset)

(checkComplainAndAdjustExpected 0)

(if 0 then (test TRUE))

(checkComplainAndAdjustExpected 1)

(if a then (test TRUE))
(if t then (test TRUE))
(if TRUE then (test TRUE))

(if TRUE then (test TRUE) else (test FALSE))

(if FALSE then (test FALSE))
(if FALSE then (test FALSE) else (test TRUE))

(checkComplainAndAdjustExpected 5)

(printout t "result: " (result) crlf)
