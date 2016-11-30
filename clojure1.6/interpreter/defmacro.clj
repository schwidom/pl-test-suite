

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

(def m7_whatis_f ::undefined)

(defmacro m7 [f] (def m7_whatis_f f) f)

(teTest (= 2 (m7 (inc 1))))
(teTest (= '(inc 1) m7_whatis_f))

; wpmxq70uo1 ; see also let.clj defmacro.clj

(def m8_whatis_f ::undefined)
(defmacro m8 [f] (def m8_whatis_f f) `(fn [] ~f))

(def m8_pending (m8 (inc 1)))
(teTest (fn? m8_pending))
(teTest (= '(inc 1) m8_whatis_f))
(teTest (= 2 (m8_pending)))

; hyr0blvel9 ; see also defmacro.clj delay-deref-force.clj delay-force.clj realized?.clj ref.clj

(checkComplainAndAdjustExpected 5)

; todo: quote.clj w1bfblyfg5 

(teTest (= '(clojure.core/list) '`()))
(teTest (= '(clojure.core/seq (clojure.core/concat (clojure.core/list (quote clojure.core/+)))) '`(+)))

(teTest (= '(clojure.core/seq (clojure.core/concat (clojure.core/list (quote clojure.core/+)) (clojure.core/list (quote defmacro-test/a)))) '`(+ a))) 
(teTest (= '(clojure.core/seq (clojure.core/concat (clojure.core/list (quote clojure.core/+)) (clojure.core/list a))) '`(+ ~a)))
(teTest (= '(clojure.core/seq (clojure.core/concat (clojure.core/list (quote clojure.core/+)) a)) '`(+ ~@a)))

(checkComplainAndAdjustExpected 5)


(println (teResult))

; udpxmt8cvv ; see also: defmacro.clj macroexpand.clj macroexpand-1.clj eval.clj let.clj binding.clj declare.clj

