
(ns fn-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(def f (fn [a] a))

(teTest (= 1 (f 1)))

(def f2 (fn ([a] a) ([] 9)))

(teTest (= 1 (f2 1)))
(teTest (= 9 (f2)))

(checkComplainAndAdjustExpected 3)

(println (teResult))

; see also: fn.clj defn.clj

