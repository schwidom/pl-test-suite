
(ns when-let-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (= nil (when-let [a nil] (teTest true) a)))

(checkComplainAndAdjustExpected 1)

(teTest (= nil (when-let [a false] (teTest true) a)))

(checkComplainAndAdjustExpected 1)

(teTest (= 0 (when-let [a 0] (teTest true) a)))

(checkComplainAndAdjustExpected 2)

(teTest (= true (when-let [a true] (teTest true) a)))

(checkComplainAndAdjustExpected 2)

(println (teResult))
