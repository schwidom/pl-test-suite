
(ns skeleton-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (= {:a 1 :b 2} (doto (new java.util.HashMap) (.put :a 1) (.put :b 2))))

(checkComplainAndAdjustExpected 1)

(println (teResult))
