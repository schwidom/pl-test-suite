
(ns cycle-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (= clojure.lang.LazySeq (type (take 5 (cycle [1 2])))))

(teTest (= [1 2 1 2 1] (take 5 (cycle [1 2]))))

; (hash (cycle [1 2])) ; forever

(checkComplainAndAdjustExpected 2)

(println (teResult))

