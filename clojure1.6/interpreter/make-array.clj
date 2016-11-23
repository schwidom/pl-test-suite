
(ns make-array-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (= "[null, null, null]" (. java.util.Arrays deepToString (make-array String 3))))

; to be continued

(checkComplainAndAdjustExpected 1)

(println (teResult))
