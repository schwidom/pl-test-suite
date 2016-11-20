

(ns cons-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (= clojure.lang.PersistentList (type (cons nil nil))))
(teTest (= clojure.lang.Cons (type (cons nil '()))))
(teTest (= clojure.lang.Cons (type (cons nil []))))

(teTest (= nil (type nil)))
(teTest (= clojure.lang.PersistentList$EmptyList (type '())))
(teTest (= clojure.lang.PersistentList (type '(1))))
(teTest (= clojure.lang.PersistentVector (type [])))
(teTest (= clojure.lang.PersistentVector (type [1])))
(teTest (= clojure.lang.PersistentArrayMap (type {})))
(teTest (= clojure.lang.PersistentArrayMap (type {:a 1})))

(teTest (= '(1 2) [1 2])) ; implicit cast
(teTest (= '() [])) ; implicit cast
(teTest (not (= '() {})))
(teTest (not (= '() nil )))
(teTest (not (= [] nil )))
(teTest (not (= {} nil )))

(teTest (= (cons 1 '(2 3)) (list 1 2 3)))
(teTest (= (cons 1 '(2 3)) '(1 2 3)))
(teTest (= (cons 1 [2 3]) '(1 2 3)))
(teTest (= (cons 1 {:a 3}) '(1 [:a 3])))

; (cons 1 2) ; IllegalArgumentException Don't know how to create ISeq from: clojure.lang.Symbol 

(teTest (= (cons 1 '()) '(1)))
(teTest (= (cons 1 nil) '(1)))
(teTest (= (cons 1 []) '(1)))
(teTest (= (cons 1 {}) '(1)))

(teTest (= (cons nil nil) '(nil)))
(teTest (= (cons '() nil) '(())))
(teTest (= (cons [] nil) '([])))
(teTest (= (cons {} nil) '({})))

(checkComplainAndAdjustExpected 28)

(println (teResult))

; see also: cons.clj topic-list-types.clj first.clj second.clj rest.clj next.clj

