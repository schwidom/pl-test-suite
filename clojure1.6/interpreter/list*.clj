
(ns list*-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (= '(1 2 3 4 5 6) (list* 1 2 3 [4 5 6])))

(teTest (= '(1 2 3 [4 5 6] 7 8 9) (list* 1 2 3 [4 5 6] [7 8 9])))

(checkComplainAndAdjustExpected 2)

(println (teResult))
