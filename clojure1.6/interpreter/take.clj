
(ns take-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (= '(0 1 2) (range 0 3)))

(teTest (= '(0 1 2) (take 3 (range 0 3))))

(teTest (= '(0 1 2) (take 3 (range 0 10))))

(teTest (= '() (take -1 (range 0 3))))
(teTest (= '() (take 0 (range 0 3))))
(teTest (= '(0 1 2) (take 4 (range 0 3))))

(teTest (= (range 0 10)  (take 10 (range 0 100))))

(checkComplainAndAdjustExpected 7)

(println (teResult))
