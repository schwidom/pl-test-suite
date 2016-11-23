
(ns dot_java.util.Arrays_deepToString-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (= "[null, null, null]" (. java.util.Arrays deepToString (make-array String 3))))

(checkComplainAndAdjustExpected 1)

(println (teResult))
