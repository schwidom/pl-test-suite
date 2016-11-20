

(ns loop-recur-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

; (loop [a 1]  (recur a)) ; loops forever a keeps 1, (recur a) sets a and retriggers loop from beginning

(teTest (= 1 (loop [] 1)))

(teTest (= 1 (loop [a 1] a)))

(teTest (= [1 2] (loop [a 1 b 2] [a b])))

(teTest (= 3 (loop [a 0] (if (< a 3) (recur (inc a)) a))))

(teTest (= [3 -1] (loop [a 0 b 0] (if (< a 3) (recur (inc a) -1) [a b]))))

(teTest (= [3 [0 1 2]] (loop [a 0 b [] ] (if (< a 3) (recur (inc a) (conj b a)) [a b])) ))

(checkComplainAndAdjustExpected 6)

(println (teResult))

