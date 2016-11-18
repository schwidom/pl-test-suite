
(ns skeleton-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)
(teTest true)
(checkComplainAndAdjustExpected 1)

(println (teResult))
