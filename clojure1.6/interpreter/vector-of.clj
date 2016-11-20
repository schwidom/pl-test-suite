

(ns vector-of-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (= '(1 2) (vector-of :int 1 2.6)))

; (teTest (= '(1.0 2.6) (vector-of :float 1 2.6)))

(teTest (= '(false true true true) (vector-of :boolean false 0 2.6 "")))

(teTest (= [\0 \1 \2] (vector-of :char 48 49 50))) ; todo

(teTest (= java.lang.Character (type \0)))

(checkComplainAndAdjustExpected 4)

(println (teResult))
