(batch* "test-env2.clp")

(reset)

(checkComplainAndAdjustExpected 0)

(assert (=> a b))
(assert (=> b c))
(assert (=> c d))

(defrule implication
 (=> ?x ?y)
 (=> ?y ?z)
=>
 (assert (=> ?x ?z))
)

(run)

(defrule test-implication

 (=> a b)
 (=> b c)
 (=> c d)

 (=> a c)
 (=> b d)

 (=> a d)

=>
 (test TRUE)
)

(run)

(checkComplainAndAdjustExpected 1)
(printout t "result: " (result) crlf)
