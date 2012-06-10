(batch* "test-env2.clp")

(reset)

(checkComplainAndAdjustExpected 0)

(assert (# a))
(assert (# b))
(assert (% a))

(do-for-all-facts
 ((?x %))
 (test TRUE)
)

(checkComplainAndAdjustExpected 1)

(do-for-all-facts
 ((?x %))
 TRUE
 (test TRUE)
)

(checkComplainAndAdjustExpected 1)

(do-for-all-facts
 ((?x %))
 FALSE
 (test TRUE)
)

(checkComplainAndAdjustExpected 0)

(do-for-all-facts
 ((?x %))
 TRUE
 FALSE
 (test TRUE)
)

(checkComplainAndAdjustExpected 1)

(do-for-all-facts
 ((?x #))
 TRUE
 (test TRUE)
)

(checkComplainAndAdjustExpected 2)

(do-for-all-facts
 ((?x #))
 (test TRUE)
)

(checkComplainAndAdjustExpected 2)

(printout t "result: " (result) crlf)

; see also : any-factp, do-for-all-facts.clp, find-fact, any-instancep, do-for-all-instances, find-instance

