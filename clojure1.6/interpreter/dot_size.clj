
(ns dot_size-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (= 2 (.size ['a 'b])))

(teTest (= 2 (. ['a 'b] size)))

; (teTest (= 10 (.size (make-array String 10))))
(teTest (= 3 (alength (make-array String 3))))

(checkComplainAndAdjustExpected 3)

(println (teResult))
