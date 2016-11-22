
(ns not-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (not (= nil false)))

(teTest (not nil))
(teTest (not false))
(teTest (not (not 0)))

(checkComplainAndAdjustExpected 4)

(println (teResult))

; d6esk5s453 ; see also: or.clj and.clj not.clj topic-logic.clj

