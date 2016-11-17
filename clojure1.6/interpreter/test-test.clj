
(ns test-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)
(teTest true)
(teTest true)
(checkComplainAndAdjustExpected 2)
(teTest true)
(teTest true)
(teTest true)
(checkComplainAndAdjustExpected 3)

(println (teResult))
