(batch* "test-env2.clp")

(reset)

(checkComplainAndAdjustExpected 0)

(defrule r1
 (not (# a 1))
 (not (# b 2))
 (not (# c 3))
=>
 (test TRUE)
)

(run)

(progn$ (?f (create$ a b c)) (assert (# ?f ?f-index)))

(defrule r1
 (# a 1)
 (# b 2)
 (# c 3)
=>
 (test TRUE)
)

(run)

(checkComplainAndAdjustExpected 1)

(printout t "result: " (result) crlf)
