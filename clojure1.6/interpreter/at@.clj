
(ns at-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(defmacro m [a] `(+ ~@a))

(teTest (= '(clojure.core/+ 1 2 3) (macroexpand '(m (1 2 3)))))

(teTest (= '(clojure.core/+ 1 2 3) (macroexpand '(m [1 2 3]))))

(teTest (= 6 (m (1 2 3))))

(teTest (= 6 (m [1 2 3])))

(checkComplainAndAdjustExpected 4)

(println (teResult))
