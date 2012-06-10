(batch* "test-env2.clp")

(reset)

(checkComplainAndAdjustExpected 0)

(run)

(defrule test-test-rule-step-1-1
 (or (a) (b))
=>
 (test FALSE)
)

(run)

(checkComplainAndAdjustExpected 0)

(undefrule test-test-rule-step-1-1)

(assert (b))

(defrule test-test-rule-step-1-2
 (or (a) (b))
=>
 (test TRUE)
)

(run)

(checkComplainAndAdjustExpected 1)
(printout t "result: " (result) crlf)

