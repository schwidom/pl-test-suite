
(ns skeleton-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (= 1 (do 1)))
(teTest (= 1 (do 2 1)))

(checkComplainAndAdjustExpected 2)

(do (teTest true) (teTest true))

(checkComplainAndAdjustExpected 2)

(teTest (= 1 (do (teTest true) 1)))

(checkComplainAndAdjustExpected 2)

(teTest (= 2 (do (do 3) 4 5 (do 2))))

(checkComplainAndAdjustExpected 1)

(println (teResult))

