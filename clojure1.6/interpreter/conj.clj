
(ns conj-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)


(teTest (= clojure.lang.PersistentVector (type (conj [1 2 3] 4 5 6))))
(teTest (= clojure.lang.PersistentList (type (conj '(1 2 3) 4 5 6))))
(teTest (= clojure.lang.PersistentHashSet (type (conj (set '(1 2 3)) 4 5 6))))

(teTest (= [1 2 3 4 5 6] (conj [1 2 3] 4 5 6)))
(teTest (= '(6 5 4 1 2 3) (conj '(1 2 3) 4 5 6))) ; ?
(teTest (= '(6 5 4 1 2 3) (conj (seq [1 2 3]) 4 5 6))) ; ?
(teTest (= '(6 5 4 1 2 3) (conj (seq '(1 2 3)) 4 5 6))) ; ?
(teTest (= #{1 4 6 3 2 5} (conj (set '(1 2 3)) 4 5 6))) ; ?

(teTest (= '(6 5 4) (conj nil 4 5 6)))
(teTest (= '(6 5 4) (conj '() 4 5 6)))


(checkComplainAndAdjustExpected 10)

(println (teResult))

