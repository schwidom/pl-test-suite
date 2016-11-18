

(ns instance?-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (instance? Object (Object.)))
(teTest (instance? Object (new Object)))
(teTest (instance? Object ""))
(teTest (instance? Object 1))
(teTest (instance? Object 1.1))
(teTest (instance? Object 1/2))
(teTest (instance? Object 1N))
(teTest (instance? Object :a))
(teTest (instance? Object ::a))
(teTest (instance? Object 'a))

(teTest (not (instance? Object nil)))
(teTest (not (instance? String 1)))

(checkComplainAndAdjustExpected 12)

(println (teResult))
