

(ns vector-of-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (= '(1 2) (vector-of :int 1 2.6)))

; (teTest (= '(1.0 2.6) (vector-of :float 1 2.6)))

(teTest (= '(false false true true true true true true) (vector-of :boolean false nil '() :a 'a 0 2.6 "")))

(teTest (= [\0 \1 \2] (vector-of :char 48 49 50))) 

(checkComplainAndAdjustExpected 3)

(println (teResult))
