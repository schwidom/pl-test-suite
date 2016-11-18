
(ns ns1-test
 (:use testenv)
 (:use testdata)
)

(checkComplainAndAdjustExpected 0)

(teTest (= val_1 testdata/val_1))

(checkComplainAndAdjustExpected 1)

(println (teResult))

