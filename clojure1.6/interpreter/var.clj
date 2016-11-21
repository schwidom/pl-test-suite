
(ns var-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(def a)

(teTest (= #'var-test/a (var a)))
(teTest (.equals #'var-test/a (var a)))
(teTest (identical? #'var-test/a (var a)))

(checkComplainAndAdjustExpected 3)

(println (teResult))
