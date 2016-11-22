
(ns interpose-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (= clojure.lang.LazySeq (type (interpose 'a []))))

(teTest (= '() (interpose 'a [])))
(teTest (= '(1) (interpose 'a [1])))
(teTest (= '(1 a 2) (interpose 'a [1 2])))
(teTest (= '(1 a 2 a 3) (interpose 'a [1 2 3])))

(checkComplainAndAdjustExpected 5)

(println (teResult))
