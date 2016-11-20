

(ns range-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (= '(0 1 2) (range 3)))

(teTest (= '(0 1 2) (range 0 3)))

(teTest (= '(10 11 12 13) (range 10 14)))

(checkComplainAndAdjustExpected 3)

(println (teResult))
