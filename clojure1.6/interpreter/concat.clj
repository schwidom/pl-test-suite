
(ns concat-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (= '(1 2 3 4) (concat [1 2] [3 4])))

(teTest (= '(1 2 3 4) (concat [1] [2 3] [4])))

(teTest (= '(1 2 3 4) (concat '(1 2) '(3 4))))

(teTest (= '(1 2 3 4) (concat [1 2] '(3 4))))

(teTest (= '(1 2 3 4) (concat [1 2] (seq [3 4]))))

(teTest (= '(1 2 [:b 4] [:a 3]) (concat [1 2] {:a 3 :b 4}))) ; ?

(teTest (= '([:c 3] [:a 1] [:b 2] [:d 4]) (concat {:a 1 :c 3} {:b 2 :d 4}))) ; ?

(teTest (= '(1 2 4 3) (concat [1 2] #{3 4}))) ; ?

(checkComplainAndAdjustExpected 8)

(println (teResult))

