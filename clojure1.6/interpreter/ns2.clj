

(ns ns2-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (= 1 testdata/val_1))

(checkComplainAndAdjustExpected 1)

(println (teResult))


