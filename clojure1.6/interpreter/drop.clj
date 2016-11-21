

(ns drop-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (= '(2 3) (drop 1 '(1 2 3))))
(teTest (= clojure.lang.LazySeq (type (drop 1 '(1 2 3)))))
(teTest (= '(2 3) (drop 1 [1 2 3])))
(teTest (= clojure.lang.LazySeq (type (drop 1 [1 2 3]))))
(teTest (= '([:b 2] [:a 1] ) (drop 1 {:a 1 :b 2 :c 3}))) ; ? 
(teTest (= clojure.lang.LazySeq (type (drop 1 {:a 1 :b 2 :c 3})))) 
(teTest (= '(3 2) (drop 1 #{1 2 3}))) ; ?
(teTest (= clojure.lang.LazySeq (type (drop 1 #{1 2 3}))))

; differs from next.clj

(teTest (= '() (drop 1 '(1))))
(teTest (= '() (drop 1 [1])))
(teTest (= '() (drop 1 {:a 1})))
(teTest (= '() (drop 1 #{1})))

; see also: drop.clj rest.clj next.clj

(checkComplainAndAdjustExpected 12)

(teTest (= '(1 2 3) (drop -1 '(1 2 3))))
(teTest (= '(1 2 3) (drop 0 '(1 2 3))))
(teTest (= '(2 3) (drop 1 '(1 2 3))))
(teTest (= '(3) (drop 2 '(1 2 3))))
(teTest (= '() (drop 3 '(1 2 3))))
(teTest (= '() (drop 4 '(1 2 3))))

(checkComplainAndAdjustExpected 6)

(println (teResult))
