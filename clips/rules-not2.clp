(batch* "test-env2.clp")

(reset)

(checkComplainAndAdjustExpected 0)

(assert (b))

(defrule test-test-rule-step-1-1
 (not (b))
=>
 (test FALSE)
)

(run)

(checkComplainAndAdjustExpected 0)

(undefrule test-test-rule-step-1-1)

(defrule drop-b ?b <- (b) => (retract ?b))
(run)
(undefrule drop-b)

(defrule test-test-rule-step-1-2
 (not (b))
=>
 (test TRUE)
)

(run)

(checkComplainAndAdjustExpected 1)
(printout t "result: " (result) crlf)

