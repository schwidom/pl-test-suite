

(ns topic-polymorphism
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(defn f1 "" {} 
 ([] "parameter count 0")
 ([a] (format "parameter count 1 : %s" a))
 ([a b] (format "parameter count 2 : %s %s" a b))
)

(teTest (= (f1) "parameter count 0"))
(teTest (= (f1 2) "parameter count 1 : 2"))
(teTest (= (f1 3 4) "parameter count 2 : 3 4"))

(defn f2 "" {} 
 ([a [b c]] (format "case1 : %s %s %s" a b c))
 ; ([[a b] c] (format "case2 : %s %s %s" a b c)) ; Can't have 2 overloads with same arity
)

(teTest (= (f2 1 [2 3]) "case1 : 1 2 3"))

(checkComplainAndAdjustExpected 4)

(println (teResult))

; see also: topic-polymorphism.clj defn.clj fn.clj 

