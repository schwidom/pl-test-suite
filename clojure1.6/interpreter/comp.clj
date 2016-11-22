
(ns comp-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (= 1 ( (comp ) 1)))
(teTest (= 2 ( (comp inc ) 1)))
(teTest (= 3 ( (comp inc inc ) 1)))
(teTest (= 2 ( (comp inc inc dec ) 1)))
(teTest (= 2 ( (comp inc dec inc ) 1)))
(teTest (= 1 ( (comp inc inc - ) 1)))
(teTest (= -1 ( (comp inc - inc ) 1)))
(teTest (= -3 ( (comp - inc inc ) 1)))

(checkComplainAndAdjustExpected 8)

(println (teResult))
