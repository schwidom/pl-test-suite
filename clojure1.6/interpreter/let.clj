
(ns let-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (= 1 (let [a 1] a)))

(teTest (= 2 (let [a 1 a 2] a)))

(teTest (= 1 (let [a 1 b a] b)))

; (teTest (= 1 (let [a b b 1] a))) ; Unable to resolve symbol: b in this context

(checkComplainAndAdjustExpected 3)

(println (teResult))
