
(ns skeleton
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)
(teTest true)
(checkComplainAndAdjustExpected 1)

(println (teResult))
