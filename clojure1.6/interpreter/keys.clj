
(ns keys-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (= '(:a :b) (sort (keys {:a 1 :b 2}))))

(teTest (= #{:a :b} (set (keys {:a 1 :b 2}))))

(teTest (= '(:b :a) (keys {:a 1 :b 2}))); ?

(checkComplainAndAdjustExpected 3)

(println (teResult))

; 8b4rxy2qq5 ; see also: topic-list-types.clj topic-map.clj keys.clj

