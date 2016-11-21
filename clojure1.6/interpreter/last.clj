

(ns last-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (= 3 (last '(1 2 3))))
(teTest (= 3 (last [1 2 3])))
(teTest (= [:a 1] (last {:a 1 :b 2 :c 3}))) ; ? 
(teTest (= 2 (last #{1 2 3}))) ; ?

; see also: first.clj second.clj last.clj rest.clj

(checkComplainAndAdjustExpected 4)

(println (teResult))
