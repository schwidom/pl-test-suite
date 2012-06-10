(batch* "test-env2.clp")

(reset)

(checkComplainAndAdjustExpected 0)

(test (eq (create$) (create$)))

(test (not (eq a (create$ a))))

(test (eq (create$ a b c d) (create$ (create$ a b) (create$ c d))))

(test (eq (create$ a b c d) (create$ (create$ a b) (create$) (create$ c d))))


(checkComplainAndAdjustExpected 4)

(assert (# a b c d))

(defrule r1
 (# $?a $?b)
=>
 (test (eq (create$ a b c d) (create$ $?a $?b)))
)

(run)

(checkComplainAndAdjustExpected 5)

(printout t "result: " (result) crlf)

; see also : create$.clp, explode$.clp, implode$.clp, progn$.clp
