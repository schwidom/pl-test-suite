
(ns skeleton
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest true)
(teTest (identity true))
(teTest (not false))
(teTest (not (not true)))

(teTest (= 'nil nil))
(teTest (= '1 1))

(teTest (nil? nil))
(teTest (symbol? 'a))
(teTest (integer? '1))
(teTest (keyword? :a))
(teTest (keyword? :1))
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

(teTest (= nil (type nil))) ; nil has no type
; (nil.); CompilerException java.lang.IllegalArgumentException: Unable to resolve classname: nil
; (new nil); CompilerException java.lang.IllegalArgumentException: Unable to resolve classname: null

(teTest (= clojure.lang.Symbol (type 'a)))
(teTest (= clojure.lang.Keyword (type :a)))
(teTest (= java.lang.Long (type 1)))
(teTest (= java.lang.Double (type 1.1)))
(teTest (= clojure.lang.Ratio (type 1/2)))
(teTest (= java.lang.String (type "1")))

(teTest (= java.lang.Class (type (type 1))))
(teTest (= java.lang.Class (type java.lang.Long)))

(checkComplainAndAdjustExpected 37)

(println (teResult))
