
(ns topic-logic-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest true)
(teTest (not false))
(teTest (not nil))
(teTest (not (not true)))

(teTest (and))
(teTest (not (or)))

(teTest (and true ))
(teTest (and true true))
(teTest (not (and true false true)))

(teTest (not (or false )))
(teTest (not (or false false)))
(teTest (not (or false nil false)))
(teTest (identity (or false nil false true)))

(checkComplainAndAdjustExpected 13)

(teTest (= 1 (if true 1 2)))
(teTest (= 2 (if false 1 2)))
(teTest (= 2 (if nil 1 2)))

(checkComplainAndAdjustExpected 3)

(println (teResult))

; d6esk5s453 ; see also: or.clj and.clj not.clj topic-logic.clj
