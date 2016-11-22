

(ns first-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (= nil (first '())))

(teTest (= 1 (first '(1 2 3))))
(teTest (= 1 (first [1 2 3])))
(teTest (= [:c 3] (first {:a 1 :b 2 :c 3}))) ; ? 
(teTest (= 1 (first #{1 2 3}))) ; ?

; c0phq1uqc2 ; see also: first.clj second.clj last.clj rest.clj drop.clj next.clj drop-last.clj butlast.clj fnext.clj take.clj
; ovmbllmxt4 ; see also: cons.clj topic-list-types.clj first.clj second.clj rest.clj next.clj

(checkComplainAndAdjustExpected 5)

(println (teResult))

