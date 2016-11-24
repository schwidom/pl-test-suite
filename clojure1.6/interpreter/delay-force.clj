
(ns delay-deref-force-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(def a1 0)

(teTest (= 0 a1))

(def d1 (delay (def a1 (inc a1))))

(teTest (not (realized? d1)))

(teTest (= 0 a1))

(teTest (= clojure.lang.Delay (type d1)))

(teTest (= #'delay-deref-force-test/a1 (force d1)))

(teTest (= 1 a1))

(teTest (realized? d1))

(teTest (= #'delay-deref-force-test/a1 (force d1)))

(teTest (= 1 a1))

(teTest (realized? d1))

(checkComplainAndAdjustExpected 10)

(def a2 0)

(teTest (= 0 a2))

(def d2 (delay (delay (def a2 (inc a2)))))

(teTest (not (realized? d2)))

(teTest (= 0 a2))

(teTest (= clojure.lang.Delay (type (force d2))))

(teTest (= 0 a2))

(teTest (realized? d2))
(teTest (not (realized? (force d2))))

(teTest (= clojure.lang.Var (type (force (force d2)))))

(teTest (realized? d2))
(teTest (realized? (force d2)))

(teTest (= 1 a2))

(checkComplainAndAdjustExpected 11)

(println (teResult))

; hyr0blvel9 ; see also defmacro.clj delay-deref-force.clj delay-force.clj realized?.clj ref.clj

