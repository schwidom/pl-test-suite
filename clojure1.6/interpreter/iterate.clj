
(ns iterate-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (= clojure.lang.Cons (type (iterate inc 1)))) ; expected lazy sequence due to doc

(teTest (= '(1 2 3) (take 3 (iterate inc 1))))

(checkComplainAndAdjustExpected 2)

(println (teResult))

