
(ns try-catch-finally-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (= 'return-on-catch (try (/ 1 0) 'return-on-ok (catch java.lang.Throwable t 'return-on-catch) (finally (teTest true) 'does-not-return))))

(teTest (= 'return-on-ok (try (/ 1 1) 'return-on-ok (catch java.lang.Throwable t 'return-on-catch) (finally (teTest true) 'does-not-return))))

(checkComplainAndAdjustExpected 4)

(teTest (= java.lang.ArithmeticException (try (/ 1 0) (catch java.lang.Throwable t (type t)) ) ))

(teTest (= ArithmeticException (try (/ 1 0) (catch Throwable t (type t)) ) ))

(checkComplainAndAdjustExpected 2)

(teTest (= RuntimeException (try (throw (new RuntimeException)) (catch Throwable t (type t)))))

(checkComplainAndAdjustExpected 1)



; not catch-able (whyever) :
; (try 1/0 (catch Throwable t nil))
; (try (doc java.lang.Throwable) (catch Throwable t nil)) ; clojure.repl/doc

(checkComplainAndAdjustExpected 0)

(println (teResult))

