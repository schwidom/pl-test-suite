
(ns reverse-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (not (reversible? (seq '(1 2 3))))) ; ?

(teTest (not (reversible? '(1 2 3)))) ; ?

(teTest (not (reversible? (seq [1 2 3])))) ; ?

(teTest (reversible? [1 2 3]))

(teTest (= '(3 2 1) (reverse (seq '(1 2 3)))))

(teTest (= '(3 2 1) (reverse '(1 2 3))))

(teTest (= '(3 2 1) (reverse [1 2 3])))

(teTest (= '(2 3 1) (reverse #{1 2 3}))) ; ?

(teTest (= '([:a 1] [:b 2] [:c 3]) (reverse {:a 1 :b 2 :c 3}))) ; ?

(checkComplainAndAdjustExpected 9)

(println (teResult))

