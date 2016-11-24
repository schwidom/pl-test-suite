
(ns topic-list-types-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (= clojure.lang.Cons (type (cons 1 (cons 2 (cons 3 nil))))))

(teTest (= clojure.lang.PersistentList (type '(1 2 3))))
(teTest (= clojure.lang.PersistentVector (type [1 2 3])))
(teTest (= clojure.lang.PersistentArrayMap (type {:a 1 :b 2 :c 3})))
(teTest (= clojure.lang.PersistentHashSet (type #{1 2 3})))

(teTest (= clojure.lang.PersistentList (type (seq '(1 2 3)))))
(teTest (= clojure.lang.PersistentVector$ChunkedSeq (type (seq [1 2 3]))))
(teTest (= clojure.lang.APersistentMap$KeySeq (type (seq #{1 2 3}))))
(teTest (= clojure.lang.PersistentArrayMap$Seq (type (seq {:a 1 :b 2 :c 3}))))

(teTest (= clojure.lang.PersistentList (type (list 1 2 3))))
(teTest (= clojure.lang.PersistentVector (type (vector 1 2 3))))

(teTest (= clojure.lang.PersistentHashSet (type (set '(1 2 3)))))
(teTest (= clojure.lang.PersistentHashSet (type (set '[1 2 3]))))
(teTest (= clojure.lang.PersistentHashSet (type (set {:a 1 :b 2 :c 3}))))
(teTest (= clojure.lang.PersistentHashSet (type (set (seq '(1 2 3))))))
(teTest (= clojure.lang.PersistentHashSet (type (set (seq [1 2 3])))))
(teTest (= clojure.lang.PersistentHashSet (type (set (seq {:a 1 :b 2 :c 3})))))


(teTest	(= [1 2 3] '(1 2 3)))
(teTest	(= [1 2 3] (cons 1 (cons 2 (cons 3 nil)))))
(teTest	(= '(1 2 3) (cons 1 (cons 2 (cons 3 nil)))))

(teTest (= {:a 1 :b 2 :c 3} {:b 2 :c 3 :a 1}))
(teTest (= '(:c :b :a) (keys {:a 1 :b 2 :c 3})))
(teTest (= '(3 2 1) (vals {:a 1 :b 2 :c 3})))

(teTest (= #{1 2 3} (set '(1 2 3 2))))
(teTest (= #{1 2 3} (set [1 2 3 2])))

(teTest (= #{1 2 3} #{3 1 2}))

(teTest (= #{[:a 1] [:b 2] [:c 3]} (set {:a 1 :b 2 :c 3})))
(teTest (= #{[:b 2] [:c 3] [:a 1]} (set {:a 1 :b 2 :c 3})))

(teTest (= '([:c 3] [:b 2] [:a 1]) (seq {:a 1 :b 2 :c 3})))

(def ide identity)

(teTest (ide (seq? (seq '(1 2 3)))))
(teTest (ide (seq? (seq [1 2 3]))))
(teTest (ide (seq? (seq #{1 2 3}))))
(teTest (ide (seq? (seq {:a 1 :b 2 :c 3}))))

(teTest (ide (coll? (seq '(1 2 3)))))
(teTest (ide (list? (seq '(1 2 3)))))
(teTest (not (vector? (seq '(1 2 3)))))

(teTest (ide (coll? (seq [1 2 3]))))
(teTest (not (list? (seq [1 2 3]))))
(teTest (not (vector? (seq [1 2 3]))))

(teTest (ide (coll? (seq #{1 2 3}))))
(teTest (not (set? (seq #{1 2 3}))))
(teTest (not (list? (seq #{1 2 3}))))
(teTest (not (vector? (seq #{1 2 3}))))

(teTest (ide (coll? (seq {:a 1 :b 2 :c 3}))))
(teTest (not (map? (seq {:a 1 :b 2 :c 3}))))
(teTest (not (list? (seq {:a 1 :b 2 :c 3}))))
(teTest (not (vector? (seq {:a 1 :b 2 :c 3}))))

(teTest (ide (seq? '(1 2 3))))
(teTest (ide (list? '(1 2 3))))

(teTest (not (list? [1 2 3])))
(teTest (ide (vector? [1 2 3])))
(teTest (not (seq? [1 2 3])))

(teTest (coll? '(1 2 3)))
(teTest (coll? [1 2 3]))
(teTest (coll? #{1 2 3}))
(teTest (coll? {:a 1 :b 2 :c 3}))

(teTest (map? {:a 1 :b 2 :c 3}))

(checkComplainAndAdjustExpected 57)

(println (teResult))

; ovmbllmxt4 ; see also: cons.clj topic-list-types.clj first.clj second.clj rest.clj next.clj
; 8b4rxy2qq5 ; see also: topic-list-types.clj topic-map.clj keys.clj
