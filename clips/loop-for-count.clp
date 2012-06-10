(batch* "test-env2.clp")

(reset)

(checkComplainAndAdjustExpected 0)

(progn
 (bind ?sum 0)

 (loop-for-count (?c 3)
  (if (= 0 ?c) then (test FALSE))
  (bind ?sum (+ ?c ?sum))
 )

 (test (= ?sum 6))
)

(progn
 (bind ?sum 0)

 (loop-for-count (?c 3 4)
  (bind ?sum (+ ?c ?sum))
 )

 (test (= ?sum 7))
)

(progn
 (bind ?sum 0)

 (loop-for-count (?c -1 1)
  (bind ?sum (+ ?c ?sum))
 )

 (test (= ?sum 0))
)

(checkComplainAndAdjustExpected 3)

(printout t "result: " (result) crlf)
