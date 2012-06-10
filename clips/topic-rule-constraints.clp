(batch* "test-env2.clp")

(reset)

(checkComplainAndAdjustExpected 0)

(defclass C (is-a USER) (slot s) (multislot ms))

(make-instance of C)

(defrule r-C

 (object (is-a C) (s ?x))

 (object (is-a C) (s ?x&:(= 1 1)))
 (object (is-a C) (s ?x&:(not FALSE)))
 (object (is-a C) (s ?x&:(= 1 1)&:(not FALSE)))

 (object (is-a C) (s ?x&?x))

 (object (is-a C) (s ?x&nil|TRUE))
 (object (is-a C) (s ?x&nil)) ; if lines swapped -> no match error

 (object (is-a C) (s nil))
 (object (is-a C) (s nil&nil))
 (object (is-a C) (s nil|TRUE))

 (not (object (is-a C) (s ?x-keeps-unbound&TRUE)))
=>

 (test (eq nil ?x))
)

(run)

(checkComplainAndAdjustExpected 1)

(defrule r-cleanup
 ?i <- (object (is-a C) (s ?x))
=>
 ;(send ?i delete)
 (unmake-instance ?i)
)

(run)

(make-instance of C (s 2))

(defrule r-C

 (object (is-a C) (s ?x))

 (object (is-a C) (s ?x&:(= 1 1)))
 (object (is-a C) (s ?x&:(not FALSE)))
 (object (is-a C) (s ?x&:(= 1 1)&:(not FALSE)))

 (object (is-a C) (s ?x&?x))

 (object (is-a C) (s ?x&TRUE|:(not (eq nil ?x))))
 (object (is-a C) (s ?x&:(not (eq nil ?x)))) ; if lines swapped -> no match error

 (object (is-a C) (s 2))
 (object (is-a C) (s 2&2))
 (object (is-a C) (s 2|TRUE))

 (not (object (is-a C) (s ?x-keeps-unbound&TRUE)))
=>

 (test (eq 2 ?x))
)

(run)

(checkComplainAndAdjustExpected 1)

(printout t "result: " (result) crlf)
