

(ns take-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (= '(1 2) ( take 2 '(1 2 3))))
(teTest (= clojure.lang.LazySeq (type ( take 2 '(1 2 3)))))
(teTest (= '(1 2) ( take 2 [1 2 3])))
(teTest (= clojure.lang.LazySeq (type ( take 2 [1 2 3]))))
(teTest (= '([:c 3] [:b 2] ) ( take 2 {:a 1 :b 2 :c 3}))) ; ? 
(teTest (= clojure.lang.LazySeq (type ( take 2 {:a 1 :b 2 :c 3})))) 
(teTest (= '(1 3) ( take 2 #{1 2 3}))) ; ?
(teTest (= clojure.lang.LazySeq (type ( take 2 #{1 2 3}))))

; differs from next.clj

(teTest (= '() ( take 0 '(1))))
(teTest (= '() ( take 0 [1])))
(teTest (= '() ( take 0 {:a 1})))
(teTest (= '() ( take 0 #{1})))

; c0phq1uqc2 ; see also: first.clj second.clj last.clj rest.clj drop.clj next.clj drop-last.clj butlast.clj fnext.clj take.clj

(checkComplainAndAdjustExpected 12)

(teTest (= '() (take -1 '(0 1 2))))
(teTest (= '() (take 0 '(0 1 2))))
(teTest (= '(0) (take 1 '(0 1 2))))
(teTest (= '(0 1) (take 2 '(0 1 2))))
(teTest (= '(0 1 2) (take 3 '(0 1 2))))
(teTest (= '(0 1 2) (take 4 '(0 1 2))))

(checkComplainAndAdjustExpected 6)

(println (teResult))
