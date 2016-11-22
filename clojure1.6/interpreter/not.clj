
(ns not-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (not (= nil false)))

(teTest (= true (if 0 true false)))
(teTest (= false (if nil true false)))
(teTest (= false (if false true false)))

(teTest (not nil))
(teTest (not false))
(teTest (= false (not true)))
(teTest (not (not 0)))

(checkComplainAndAdjustExpected 8)

(println (teResult))

; d6esk5s453 ; see also: or.clj and.clj not.clj topic-logic.clj

