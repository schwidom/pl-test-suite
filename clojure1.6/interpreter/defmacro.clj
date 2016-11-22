

(ns defmacro-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(defmacro m1 [])

(teTest (= nil (m1)))

(defmacro m2 [a] a)

(teTest (= 1 (m2 1)))

(defmacro m3 [a b] (+ a b))

(teTest (= 5 (m3 2 3)))

(defmacro m4 [a b] `(+ ~a ~b))

(teTest (= 5 (m4 2 3)))

(teTest (= '(clojure.core/+ 2 3) (macroexpand '(m4 2 3))))

(teTest (= 5 (eval (macroexpand '(m4 2 3)))))

(defmacro m5 [a b] `(identity ~(+ a b)))

(teTest (= 5 (m5 2 3)))

(teTest (= '(clojure.core/identity 5) (macroexpand '(m5 2 3))))

(teTest (= 5 (eval (macroexpand '(m5 2 3)))))

(defmacro m6 [a b] `(identity ~(identity `(+ ~a ~b))))

(teTest (= 5 (m6 2 3)))

(teTest (= '(clojure.core/identity (clojure.core/+ 2 3)) (macroexpand '(m6 2 3))))

(teTest (= 5 (eval (macroexpand '(m6 2 3)))))


(defmacro add_a_b [] `(+ a b))
(def add_a_b_code '(+ a b))

(teTest (= '(clojure.core/+ defmacro-test/a defmacro-test/b) (macroexpand '(add_a_b))))

; (teTest (= 5 (let [a 2 b 3] (+ a b))))
; (teTest (= 5 (let [a 2 b 3] (eval add_a_b_code)))) ; Unable to resolve symbol: a in this context
; (teTest (= 5 (let [a 2 b 3] (add_a_b)))) ; No such var: defmacro-test/a
; (teTest (= 5 (binding [a 2 b 3] (eval add_a_b_code)))) ; Unable to resolve var: a in this context
; (teTest (= 5 (let [a 2 b 3] (add_a_b)))) ; clojure.lang.Var$Unbound cannot be cast to java.lang.Number

(declare ^:dynamic a)
(declare ^:dynamic b)

; (teTest (= 5 (let [a 2 b 3] (+ a b))))
; (teTest (= 5 (let [a 2 b 3] (eval add_a_b_code)))) ; clojure.lang.Var$Unbound cannot be cast to java.lang.Number
; (teTest (= 5 (let [a 2 b 3] (add_a_b)))) ; clojure.lang.Var$Unbound cannot be cast to java.lang.Number
(teTest (= 5 (binding [a 2 b 3] (eval add_a_b_code)))) ; works
; (teTest (= 5 (let [a 2 b 3] (add_a_b)))) ; clojure.lang.Var$Unbound cannot be cast to java.lang.Number

(checkComplainAndAdjustExpected 14)

(println (teResult))

; udpxmt8cvv ; see also: defmacro.clj macroexpand.clj macroexpand-1.clj eval.clj let.clj binding.clj declare.clj

