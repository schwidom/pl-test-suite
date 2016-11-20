

(ns first-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (= 1 (first '(1 2 3))))
(teTest (= 1 (first [1 2 3])))
(teTest (= [:c 3] (first {:a 1 :b 2 :c 3}))) ; ? 
(teTest (= 1 (first #{1 2 3}))) ; ?

(checkComplainAndAdjustExpected 4)

(println (teResult))
