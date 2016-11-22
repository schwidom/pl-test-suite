

(ns topic-polymorphism-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(defn f1 "" {} 
 ([] "parameter count 0")
 ([a] (format "parameter count 1 : %s" a))
 ([a b] (format "parameter count 2 : %s %s" a b))
)

(teTest (= (f1) "parameter count 0"))
(teTest (= (f1 2) "parameter count 1 : 2"))
(teTest (= (f1 3 4) "parameter count 2 : 3 4"))

(defn f2 "" {} 
 ([a [b c]] (format "case1 : %s %s %s" a b c))
 ; ([[a b] c] (format "case2 : %s %s %s" a b c)) ; Can't have 2 overloads with same arity
)

(teTest (= (f2 1 [2 3]) "case1 : 1 2 3"))

; (defmulti f3 (fn [x] [(:key1 x) (:key2 x)]))
; (defmethod f3 [1 2] [a b] (+ a b))

(defmulti f3 (fn [x] [(:k x)]))
(defmethod f3 [:a] [key] ["case1" key])
(defmethod f3 [:b] [key] ["case2" key])

(teTest (= ["case1" {:k :a}] (f3 {:k :a})))
(teTest (= ["case2" {:k :b}] (f3 {:k :b})))


(defmulti f4 (fn [x y] [(:k1 x) (:k2 y)]))
(defmethod f4 [:a :a] [key1 key2] ["case1" key1 key2])

(teTest (= ["case1" {:k1 :a} {:k2 :a}] (f4 {:k1 :a} {:k2 :a})))
(teTest (= ["case1" {:k1 :a :kx :x} {:k2 :a :ky :y}] (f4 {:k1 :a :kx :x} {:k2 :a :ky :y})))


(defmulti f5 (fn [x] [(:k1 x) (:k2 x)]))
(defmethod f5 [:a :a] [key] [ "case1" key ])
(defmethod f5 [:a :b] [key] [ "case2" key ])
(defmethod f5 :default [key] [ "case3" key ])
(defmethod f5 [:a nil] [key] [ "case4" key ])

(teTest (= ["case1" {:k1 :a, :k2 :a}] (f5 {:k1 :a :k2 :a})))
(teTest (= ["case2" {:k1 :a, :k2 :b}] (f5 {:k1 :a :k2 :b})))
(teTest (= ["case3" {:k1 :b, :k2 :b}] (f5 {:k1 :b :k2 :b})))
(teTest (= ["case4" {:k1 :a, :kX :b}] (f5 {:k1 :a :kX :b})))

(checkComplainAndAdjustExpected 12)

(println (teResult))

; z6bud4wslo ; see also: topic-polymorphism.clj defn.clj fn.clj defmulti.clj defmethod.clj

