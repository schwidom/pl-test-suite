

(ns first-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (= 2 (second '(1 2 3))))
(teTest (= 2 (second [1 2 3])))
(teTest (= [:b 2] (second {:a 1 :b 2 :c 3}))) ; ? 
(teTest (= 3 (second #{1 2 3}))) ; ?

; see also: first.clj second.clj last.clj rest.clj

(checkComplainAndAdjustExpected 4)

(println (teResult))
