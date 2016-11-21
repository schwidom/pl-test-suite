
(ns to-array-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(def a1 (to-array '(1 2 3)))
(def a2 (to-array '(1 2 3)))
(def a3 (to-array [1 2 3]))

; (teTest (array? a1))) ; missing
(teTest (not (seq? a1)))
(teTest (not (list? a1)))
(teTest (not (vector? a1)))

(teTest (= a1 a1))
(teTest (.equals a1 a1))
(teTest (identical? a1 a1))

(teTest (not (= a1 a2))) ; ?
(teTest (not (.equals a1 a2))) ; ?

(teTest (= "class [Ljava.lang.Object;" (str (type a1))))
(teTest (= "class [Ljava.lang.Object;" (str (type a3))))

(checkComplainAndAdjustExpected 10)

(println (teResult))
