
(ns map-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (= clojure.lang.LazySeq (type (map + [1]))))

(teTest (= [2 3 4] (map inc [1 2 3])))
(teTest (= [4 6 3] (map + [1 2 3] [3 4 0])))
(teTest (= [4 6 3] (map + [1 2 3] [3 4 0 9 8 7])))
(teTest (= [4 6 3] (map + [1 2 3 5] [3 4 0])))

(checkComplainAndAdjustExpected 5)

(println (teResult))
