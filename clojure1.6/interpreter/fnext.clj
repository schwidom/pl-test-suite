

(ns fnext-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (= nil (fnext '(1))))

(teTest (= 2 (fnext '(1 2 3))))
(teTest (= 2 (fnext [1 2 3])))
(teTest (= [:b 2] (fnext {:a 1 :b 2 :c 3}))) ; ? 
(teTest (= 3 (fnext #{1 2 3}))) ; ?

; c0phq1uqc2 ; see also: first.clj second.clj last.clj rest.clj drop.clj next.clj drop-last.clj butlast.clj fnext.clj

(checkComplainAndAdjustExpected 5)

(println (teResult))
