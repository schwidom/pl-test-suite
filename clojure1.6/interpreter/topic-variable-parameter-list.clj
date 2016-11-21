
(ns topic-variable-parameter-list-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(defn f1 [ & b] b)
(defn f2 [ a & b] [a b])

(teTest (= nil (f1)))
(teTest (= '(1) (f1 1)))
(teTest (= '(1 2) (f1 1 2)))

(teTest (= [9 nil] (f2 9)))
(teTest (= [9 '(1)] (f2 9 1)))
(teTest (= [9 '(1 2)] (f2 9 1 2)))

(checkComplainAndAdjustExpected 6)

(println (teResult))
