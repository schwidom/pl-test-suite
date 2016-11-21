
(ns reduce-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (= 0 (reduce + [])))
(teTest (= 10 (reduce + 10 [])))

(teTest (= 1 (reduce + [1])))
(teTest (= 11 (reduce + 10 [1])))

(teTest (= 3 (reduce + [1 2])))
(teTest (= 13 (reduce + 10 [1 2])))

; see also areduce.clj reduce.clj

(checkComplainAndAdjustExpected 6)

(println (teResult))
