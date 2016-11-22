
(ns delay-deref-force-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(def a1 0)
(def a2 0)

(teTest (= 0 a1))
(teTest (= 0 a2))

(def d1 (delay (def a1 (inc a1))))
(def d2 (delay (def a2 (inc a2))))

(teTest (= 0 a1))
(teTest (= 0 a2))

(teTest (= clojure.lang.Delay (type d1)))
(teTest (= clojure.lang.Delay (type d2)))

(teTest (= #'delay-deref-force-test/a1 (force d1)))
(teTest (= #'delay-deref-force-test/a2 (deref d2)))

(teTest (= 1 a1))
(teTest (= 1 a2))

(teTest (= #'delay-deref-force-test/a1 (force d1)))
(teTest (= #'delay-deref-force-test/a2 (deref d2)))

(teTest (= 1 a1))
(teTest (= 1 a2))

(checkComplainAndAdjustExpected 14)

(println (teResult))
