
(ns and-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (not (= nil false)))

(teTest (= true (and)))

(teTest (= true (if 0 true false)))
(teTest (= false (if nil true false)))
(teTest (= false (if false true false)))

(teTest (= 0 (and 0)))
(teTest (= nil (and nil)))
(teTest (= false (and false)))

(teTest (= 0 (and 0 0)))
(teTest (= nil (and nil 0)))
(teTest (= false (and false 0)))

(teTest (= nil (and 0 nil)))
(teTest (= nil (and nil nil)))
(teTest (= false (and false nil)))

(teTest (= false (and 0 false)))
(teTest (= nil (and nil false)))
(teTest (= false (and false false)))

(teTest (= 1 ( and 0 1)))
(teTest (= 0 ( and 1 0)))

(checkComplainAndAdjustExpected 19)

(println (teResult))

; d6esk5s453 ; see also: or.clj and.clj not.clj topic-logic.clj

