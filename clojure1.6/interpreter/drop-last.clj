

(ns drop-last-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (= '(1 2) (drop-last 1 '(1 2 3))))
(teTest (= clojure.lang.LazySeq (type (drop-last 1 '(1 2 3)))))
(teTest (= '(1 2) (drop-last 1 [1 2 3])))
(teTest (= clojure.lang.LazySeq (type (drop-last 1 [1 2 3]))))
(teTest (= '([:c 3] [:b 2] ) (drop-last 1 {:a 1 :b 2 :c 3}))) ; ? 
(teTest (= clojure.lang.LazySeq (type (drop-last 1 {:a 1 :b 2 :c 3})))) 
(teTest (= '(1 3) (drop-last 1 #{1 2 3}))) ; ?
(teTest (= clojure.lang.LazySeq (type (drop-last 1 #{1 2 3}))))

; differs from next.clj

(teTest (= '() (drop-last 1 '(1))))
(teTest (= '() (drop-last 1 [1])))
(teTest (= '() (drop-last 1 {:a 1})))
(teTest (= '() (drop-last 1 #{1})))

; c0phq1uqc2 ; see also: first.clj second.clj last.clj rest.clj drop.clj next.clj drop-last.clj butlast.clj fnext.clj take.clj

(checkComplainAndAdjustExpected 12)

(teTest (= '(1 2 3) (drop-last -1 '(1 2 3))))
(teTest (= '(1 2 3) (drop-last 0 '(1 2 3))))
(teTest (= '(1 2) (drop-last 1 '(1 2 3))))
(teTest (= '(1 2) (drop-last '(1 2 3))))
(teTest (= '(1) (drop-last 2 '(1 2 3))))
(teTest (= '() (drop-last 3 '(1 2 3))))
(teTest (= '() (drop-last 4 '(1 2 3))))

(checkComplainAndAdjustExpected 7)

(println (teResult))
