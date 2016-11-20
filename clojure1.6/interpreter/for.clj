

(ns for-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (= '(1 2 3) (for [a '(1 2 3)] a)))

(teTest (= '([1 1] [1 2] [2 1] [2 2]) (for [a '(1 2) b '(1 2)] [a b])))

; (take 100 (for [x (range 100000000) y (range 1000000) :while (< y x)] [x y]))  ; fast!

(checkComplainAndAdjustExpected 2)

(println (teResult))
