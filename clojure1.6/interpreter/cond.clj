

(ns cond-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (= nil (cond)))

(teTest (= nil (cond false 1)))
(teTest (= 1 (cond true 1)))

(teTest (= nil (cond false 1 false 2)))
(teTest (= 2 (cond false 1 true 2)))
(teTest (= 1 (cond true 1 true 2)))
(teTest (= 1 (cond true 1 false 2)))

(checkComplainAndAdjustExpected 7)

(println (teResult))
