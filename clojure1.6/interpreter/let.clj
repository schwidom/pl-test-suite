
(ns let-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (= 1 (let [a 1] a)))

(teTest (= 2 (let [a 1 a 2] a)))

(teTest (= 1 (let [a 1 b a] b)))

; (teTest (= 1 (let [a b b 1] a))) ; Unable to resolve symbol: b in this context

(checkComplainAndAdjustExpected 3)

(teTest (= '(clojure.core/inc (inc 1)) (let [a '(inc 1)] `(inc ~a)) ))
(teTest (= 3 (eval (let [a '(inc 1)] `(inc ~a))) ))

; wpmxq70uo1 ; see also let.clj defmacro.clj

(checkComplainAndAdjustExpected 2)

(println (teResult))

; udpxmt8cvv ; see also: defmacro.clj macroexpand.clj macroexpand-1.clj eval.clj let.clj binding.clj declare.clj

