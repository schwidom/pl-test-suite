

(ns loop-recur-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

; (loop [a 1]  (recur a)) ; loops forever a keeps 1, (recur a) sets a and retriggers loop from beginning



(checkComplainAndAdjustExpected 0)

(println (teResult))
