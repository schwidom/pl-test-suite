(batch* "test-env2.clp")

(reset)

(checkComplainAndAdjustExpected 0)

(assert (=> a b))
(assert (=> b c))
(assert (=> c d))

(assert (=> a c))
(assert (=> b d))

(assert (=> a d))

(defrule implication-reduction
 (=> ?x ?y)
 (=> ?y ?z)
 ?implication <- (=> ?x ?z)
=>
 (retract ?implication)
)

(run)

(defrule test-implication-reduction

 (=> a b)
 (=> b c)
 (=> c d)

 (not (=> a c))
 (not (=> b d))

 (not (=> a d))

=>
 (test TRUE)
)

(run)

(checkComplainAndAdjustExpected 1)
(printout t "result: " (result) crlf)

