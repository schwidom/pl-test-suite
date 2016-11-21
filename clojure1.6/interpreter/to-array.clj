
(ns to-array-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(def a1 (to-array '(1 2 3)))
(def a2 (to-array '(1 2 3)))
(def a3 (to-array [1 2 3]))

(teTest (= a1 a1))
(teTest (.equals a1 a1))
(teTest (identical? a1 a1))

(teTest (not (= a1 a2))) ; ?
(teTest (not (.equals a1 a2))) ; ?

(teTest (= "class [Ljava.lang.Object;" (str (type a1))))
(teTest (= "class [Ljava.lang.Object;" (str (type a3))))

(checkComplainAndAdjustExpected 7)

(println (teResult))
