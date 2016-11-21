
(ns lazy-seq-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(defn myrange [start] 
 (lazy-seq (concat [start] (myrange (inc start))))
)

(teTest (= '(1 2 3) (take 3 (myrange 1))))

(teTest (= '(2 3 4) (take 3 (rest (myrange 1)))))

(checkComplainAndAdjustExpected 2)

(println (teResult))

