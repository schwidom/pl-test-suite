

(ns first-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (= '(2 3) (rest '(1 2 3))))
(teTest (= clojure.lang.PersistentList (type (rest '(1 2 3)))))
(teTest (= '(2 3) (rest [1 2 3])))
(teTest (= clojure.lang.PersistentVector$ChunkedSeq (type (rest [1 2 3]))))
(teTest (= '([:b 2] [:a 1] ) (rest {:a 1 :b 2 :c 3}))) ; ? 
(teTest (= clojure.lang.PersistentArrayMap$Seq (type (rest {:a 1 :b 2 :c 3})))) 
(teTest (= '(3 2) (rest #{1 2 3}))) ; ?
(teTest (= clojure.lang.APersistentMap$KeySeq (type (rest #{1 2 3}))))

(checkComplainAndAdjustExpected 8)

(println (teResult))
