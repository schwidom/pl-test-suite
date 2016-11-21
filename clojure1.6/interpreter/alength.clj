
(ns alength-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (= 10 (alength (make-array String 10))))

(checkComplainAndAdjustExpected 1)

(println (teResult))
