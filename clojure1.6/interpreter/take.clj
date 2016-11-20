
(ns take-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (= '(0 1 2) (range 0 3)))

(teTest (= '(0 1 2) (take 3 (range 0 3))))

(teTest (= '(0 1 2) (take 3 (range 0 10))))

(teTest (= (range 0 10)  (take 10 (range 0 100))))

(checkComplainAndAdjustExpected 4)

(println (teResult))
