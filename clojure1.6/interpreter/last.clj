

(ns last-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (= 3 (last '(1 2 3))))
(teTest (= 3 (last [1 2 3])))
(teTest (= [:a 1] (last {:a 1 :b 2 :c 3}))) ; ? 
(teTest (= 2 (last #{1 2 3}))) ; ?

; c0phq1uqc2 ; see also: first.clj second.clj last.clj rest.clj drop.clj next.clj drop-last.clj butlast.clj fnext.clj

(checkComplainAndAdjustExpected 4)

(println (teResult))
