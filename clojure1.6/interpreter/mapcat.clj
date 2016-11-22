
(ns mapcat-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (= clojure.lang.LazySeq (type (mapcat (fn [a] [a]) []))))

(teTest (= '() (mapcat (fn [a] [a]) [])))
(teTest (= '(1) (mapcat (fn [a] [a]) [1])))

(teTest (= '(1 2) (mapcat (fn [a] [a]) [1 2])))

(teTest (= '(1 3 2 4) (mapcat (fn [a b] [a b]) [1 2] [3 4])))

(teTest (= '([1 3] [2 4]) (mapcat (fn [a b] [[a b]]) [1 2] [3 4])))

(checkComplainAndAdjustExpected 6)

(println (teResult))

