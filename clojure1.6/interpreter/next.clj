

(ns next-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (= '(2 3) (next '(1 2 3))))
(teTest (= clojure.lang.PersistentList (type (next '(1 2 3)))))
(teTest (= '(2 3) (next [1 2 3])))
(teTest (= clojure.lang.PersistentVector$ChunkedSeq (type (next [1 2 3]))))
(teTest (= '([:b 2] [:a 1] ) (next {:a 1 :b 2 :c 3}))) ; ? 
(teTest (= clojure.lang.PersistentArrayMap$Seq (type (next {:a 1 :b 2 :c 3})))) 
(teTest (= '(3 2) (next #{1 2 3}))) ; ?
(teTest (= clojure.lang.APersistentMap$KeySeq (type (next #{1 2 3}))))

; differs from rest.clj

(teTest (= nil (next '(1))))
(teTest (= nil (next [1])))
(teTest (= nil (next {:a 1})))
(teTest (= nil (next #{1})))

; c0phq1uqc2 ; see also: first.clj second.clj last.clj rest.clj drop.clj next.clj drop-last.clj butlast.clj fnext.clj
; ovmbllmxt4 ; see also: cons.clj topic-list-types.clj first.clj second.clj rest.clj next.clj

(checkComplainAndAdjustExpected 12)

(println (teResult))
