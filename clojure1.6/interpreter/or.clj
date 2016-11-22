
(ns or-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (not (= nil false)))

(teTest (= true (if 0 true false)))
(teTest (= false (if nil true false)))
(teTest (= false (if false true false)))

(teTest (= nil (or)))
(teTest (= nil (or nil)))
(teTest (= false (or false)))
(teTest (= 0 (or 0)))
(teTest (= 1 (or 1)))
(teTest (= 0 (or 0 1)))
(teTest (= 1 (or 1 0)))

(teTest (= 0 (or nil 0)))
(teTest (= 0 (or false 0)))

(teTest (= false (or false false)))
(teTest (= false (or nil false)))
(teTest (= nil (or false nil)))
(teTest (= nil (or nil nil)))

(checkComplainAndAdjustExpected 17)

(teTest (= 0 (or 0 (teTest true) 1)))

(checkComplainAndAdjustExpected 1)

(println (teResult))

; d6esk5s453 ; see also: or.clj and.clj not.clj topic-logic.clj

