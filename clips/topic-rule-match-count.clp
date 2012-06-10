(batch* "test-env2.clp")

(reset)

(checkComplainAndAdjustExpected 0)

(assert (#1 a))

(defrule r1
 (#1 ?s)
 (#1 ?t)
 =>
 (test TRUE)
)

(run)

(checkComplainAndAdjustExpected 1)

(assert (#2 a))
(assert (#2 b))

(defrule r2
 (#2 ?s)
 (#2 ?t)
 =>
 (test TRUE)
)

(run)

(checkComplainAndAdjustExpected 4)

(printout t "result: " (result) crlf)
