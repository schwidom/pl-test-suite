
(ns merge-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (= 1 (merge 1)))
(teTest (= nil (merge nil)))
(teTest (= '() (merge '())))
(teTest (= [] (merge [])))
(teTest (= {} (merge {})))
(teTest (= #{} (merge #{})))

(teTest (= {:a 1 :b 2} (merge {:a 1 :b 2})))

(teTest (= {:a 1 :b 3 :c 4} (merge {:a 1 :b 2} {:b 3 :c 4} )))

(teTest (= {:a 1 :b 2 :c 4} (merge {:b 3 :c 4} {:a 1 :b 2} )))

(teTest (= '((4 5) (2 3) 0 1) (merge '(0 1) '(2 3) '(4 5)))) ; ?

(teTest (= [0 1 [2 3] [4 5]] (merge [0 1] [2 3] [4 5]))) ;?

(teTest (= [0 1 [2 3] [4 5]] (merge [0 1] [2 3] [4 5]))) ;?

(teTest (= #{#{4 3} 1 2} (merge #{1 2} #{3 4}))) ; ?

(checkComplainAndAdjustExpected 13)

(println (teResult))
