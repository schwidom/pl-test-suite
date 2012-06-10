(batch* "test-env.clp")

(reset)

(defrule test-test-rule-step-0
 (initial-fact)
=>
 (assert (test-env checkComplainAndAdjustExpected 0 step-0))
 (assert (test-test step-1-1))
 (assert (test-test step-1-2))
)

(run)

(assert (b))

(defrule test-test-rule-step-1-1
 (test-test step-1-1)
 (not (b))
=>
 (assert (test-env test FALSE step-1 test-1))
 (assert (test-test step-2))
)

(run)

(undefrule test-test-rule-step-1-1)

(defrule drop-b ?b <- (b) => (retract ?b))
(run)
(undefrule drop-b)

(defrule test-test-rule-step-1-2
 (test-test step-1-2)
 (not (b))
=>
 (assert (test-env test TRUE step-1 test-2))
 (assert (test-test step-2))
)

(run)

(defrule test-test-rule-step-2
 (test-test step-2)
=>
 (assert (test-env checkComplainAndAdjustExpected 1 step-2))
 (assert (test-test step-5))
)

(run)

(defrule test-test-rule-step-5
 (test-test step-5)
=>
 (assert (test-env result step-5))
 (assert (test-test step-6))
)

(run)

(defrule test-test-rule-step-6
 (test-test step-6)
 (test-env-variables (result ?result))
=>
 (printout t "result: " ?result crlf)
)

(run)
