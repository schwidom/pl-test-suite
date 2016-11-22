
(ns mapv-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (= clojure.lang.PersistentVector (type (mapv + [1]))))

(teTest (= [2 3 4] (mapv inc [1 2 3])))
(teTest (= [4 6 3] (mapv + [1 2 3] [3 4 0])))
(teTest (= [4 6 3] (mapv + [1 2 3] [3 4 0 9 8 7])))
(teTest (= [4 6 3] (mapv + [1 2 3 5] [3 4 0])))

(checkComplainAndAdjustExpected 5)

(println (teResult))
