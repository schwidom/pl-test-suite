

(ns topic-lambda-calculus-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(def y (fn [f] (fn [p] ((f (y f)) p)))) ; Y-Combinator

(def fak (fn [f] (fn [n] (if (= 0 n) 1 (* n (f (- n 1))))))) ; factorial


(teTest (= 1 ((y fak) 0)))
(teTest (= 1 ((y fak) 1)))
(teTest (= 2 ((y fak) 2)))
(teTest (= 6 ((y fak) 3)))
(teTest (= 24 ((y fak) 4)))


(checkComplainAndAdjustExpected 5)

(println (teResult))
