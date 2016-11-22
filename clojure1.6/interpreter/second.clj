

(ns second-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (= nil (second '(1))))

(teTest (= 2 (second '(1 2 3))))
(teTest (= 2 (second [1 2 3])))
(teTest (= [:b 2] (second {:a 1 :b 2 :c 3}))) ; ? 
(teTest (= 3 (second #{1 2 3}))) ; ?

; c0phq1uqc2 ; see also: first.clj second.clj last.clj rest.clj drop.clj next.clj drop-last.clj butlast.clj fnext.clj
; ovmbllmxt4 ; see also: cons.clj topic-list-types.clj first.clj second.clj rest.clj next.clj

(checkComplainAndAdjustExpected 5)

(println (teResult))


