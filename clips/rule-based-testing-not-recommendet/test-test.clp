(batch* "test-env.clp")

(reset)

(defrule test-test-rule-step-0
 (initial-fact)
=>
 (assert (test-env checkComplainAndAdjustExpected 0 step-0))
 (assert (test-test step-1))
)

(run)

(defrule test-test-rule-step-1
 (test-test step-1)
=>
 (assert (test-env test TRUE step-1 test-1))
 (assert (test-env test TRUE step-1 test-2))
 (assert (test-test step-2))
)

(run)

(defrule test-test-rule-step-2
 (test-test step-2)
=>
 (assert (test-env checkComplainAndAdjustExpected 2 step-2))
 (assert (test-test step-3))
)

(run)

(defrule test-test-rule-step-3
 (test-test step-3)
=>
 (assert (test-env test TRUE step-3 test-1))
 (assert (test-env test TRUE step-3 test-2))
 (assert (test-env test TRUE step-3 test-3))
 (assert (test-test step-4))
)

(run)

(defrule test-test-rule-step-4
 (test-test step-4)
=>
 (assert (test-env checkComplainAndAdjustExpected 3 step-4))
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
