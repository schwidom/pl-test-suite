
(ns count-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (= 0 (count nil)))

(teTest (= 3 (count [4 6 5])))

(teTest (= 3 (count (make-array String 3))))

(teTest (= 3 (count "abc")))

(teTest (= 3 (count {:a 1 :b 2 :c 4})))

(teTest (= 3 (count #{1 2 4})))

; (count (cycle [1])) ; never ends

(checkComplainAndAdjustExpected 6)

(println (teResult))
