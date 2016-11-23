
(ns nil?-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (nil? nil))
(teTest (nil? 'nil))

(checkComplainAndAdjustExpected 2)

(println (teResult))
