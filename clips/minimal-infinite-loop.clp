; run with clips -f %

(assert (a))

(defrule r
 ?x <- (a)
=>
 (retract ?x)
 (assert (a))
)

(run)


