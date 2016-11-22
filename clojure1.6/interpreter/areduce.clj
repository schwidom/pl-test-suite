
(ns areduce-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(def a (to-array []))

(teTest (= 0 (areduce a i r 0 (+ r (nth a i)))))
(teTest (= 10 (areduce a i r 10 (+ r (nth a i)))))

(def a (to-array [1]))

(teTest (= 1 (areduce a i r 0 (+ r (nth a i)))))
(teTest (= 11 (areduce a i r 10 (+ r (nth a i)))))

(def a (to-array [1 2]))

(teTest (= 3 (areduce a i r 0 (+ r (nth a i)))))
(teTest (= 13 (areduce a i r 10 (+ r (nth a i)))))

; etyc439hrp ; see also: areduce.clj reduce.clj

(checkComplainAndAdjustExpected 6)

(println (teResult))
