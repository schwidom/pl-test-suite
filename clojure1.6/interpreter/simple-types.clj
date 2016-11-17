
(ns skeleton
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest true)
(teTest (identity true))
(teTest (not false))
(teTest (not (not true)))

(teTest (= java.lang.Long (type 1)))
(teTest (= java.lang.Class (type (type 1))))
(teTest (= java.lang.Class (type java.lang.Long)))

(teTest (string? "1"))
(teTest (integer? 1))
(teTest (rational? 1))
(teTest (rational? 1/2))
(teTest (not (integer? 1/2)))
(teTest (identity (integer? (* 1/2 2/1) )))

(teTest (float? 1.1))
(teTest (not (float? (rationalize 1.1))))
(teTest (identity (rational? (rationalize 1.1))))

(teTest (= "1" (str 1)))
(teTest (= "1.1" (str 1.1)))
(teTest (= "1/2" (str 1/2)))
(teTest (= 1 (long 1.1)))
(teTest (= 1. (float 1)))
(teTest (not (= 1 (float 1))))

(teTest (= 1 (Integer. "1")))
(teTest (= 1. (Double. "1")))

(teTest (= java.lang.Double (type 1.1)))
(teTest (= clojure.lang.Ratio (type 1/2)))
(teTest (= java.lang.String (type "1")))

(checkComplainAndAdjustExpected 27)

(println (teResult))
