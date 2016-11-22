

(ns butlast-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (= '(1 2) (butlast '(1 2 3))))
(teTest (= clojure.lang.PersistentVector$ChunkedSeq (type (butlast '(1 2 3)))))
(teTest (= '(1 2) (butlast [1 2 3])))
(teTest (= clojure.lang.PersistentVector$ChunkedSeq (type (butlast [1 2 3]))))
(teTest (= '([:c 3] [:b 2] ) (butlast {:a 1 :b 2 :c 3}))) ; ? 
(teTest (= clojure.lang.PersistentVector$ChunkedSeq (type (butlast {:a 1 :b 2 :c 3})))) 
(teTest (= '(1 3) (butlast #{1 2 3}))) ; ?
(teTest (= clojure.lang.PersistentVector$ChunkedSeq (type (butlast #{1 2 3}))))

; differs from next.clj

(teTest (= nil (butlast '(1))))
(teTest (= nil (butlast [1])))
(teTest (= nil (butlast {:a 1})))
(teTest (= nil (butlast #{1})))

; c0phq1uqc2 ; see also: first.clj second.clj last.clj rest.clj drop.clj next.clj drop-last.clj butlast.clj fnext.clj take.clj

(checkComplainAndAdjustExpected 12)

(teTest (= '(1 2) (butlast '(1 2 3))))

(checkComplainAndAdjustExpected 1)

(println (teResult))
