

(ns rest-test
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


; differs from next.clj

(teTest (= '() (rest '(1))))
(teTest (= '() (rest [1])))
(teTest (= '() (rest {:a 1})))
(teTest (= '() (rest #{1})))

(checkComplainAndAdjustExpected 12)

(println (teResult))
