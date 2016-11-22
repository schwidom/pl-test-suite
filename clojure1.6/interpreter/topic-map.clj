
(ns topic-map-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (map? {:a 1}))

(teTest (= 1 (:a {:a 1 :b 2})))
(teTest (= 2 (:b {:a 1 :b 2})))

; todo ... to be continued

(checkComplainAndAdjustExpected 3)

(println (teResult))

