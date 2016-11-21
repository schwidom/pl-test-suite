
(ns neg?-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (neg? -2))
(teTest (neg? -1))
(teTest (not (neg? 0)))
(teTest (not (neg? 1)))
(teTest (not (neg? 2)))

(checkComplainAndAdjustExpected 5)

(println (teResult))
