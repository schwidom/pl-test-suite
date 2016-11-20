

(ns identical?-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (identical? nil nil)) ; 11v1smec97 
(teTest (identical? nil 'nil)) 
(teTest (identical? '() '())) ; ds15wqov6l 
(teTest (identical? [] [])) ; ds15wqov6l 
(teTest (identical? {} {})) ; ds15wqov6l 
(teTest (identical? #{} #{})) ; ds15wqov6l 
(teTest (identical? true true))
(teTest (identical? false false))
(teTest (identical? 1 1))
(teTest (identical? 1 '1))
(teTest (identical? :a :a))
(teTest (identical? ::a ::a))

(teTest (identical? nil (seq nil)))
(teTest (identical? nil (seq '())))
(teTest (identical? nil (seq [])))
(teTest (identical? nil (seq #{})))
(teTest (identical? nil (seq {})))

(teTest (identity (identical? 0N 0N))) ; ?
(teTest (not (identical? 1N 1N))) ; ?
(teTest (not (identical? 0.0 0.0)))
(teTest (not (identical? 1.0 1.0)))
(teTest (not (identical? 1.1 1.1)))
(teTest (not (identical? 'a 'a)))

(teTest (not (identical? '() nil))) ; 11v1smec97
(teTest (not (identical? '() []))) ; ds15wqov6l 

(teTest (not (identical? '(1) '(1)))) ; ds15wqov6l
(teTest (not (identical? [1] [1]))) ; ds15wqov6l 
(teTest (not (identical? {:a 1} {:a 1}))) ; ds15wqov6l 
(teTest (not (identical? #{1} #{1}))) ; ds15wqov6l 

(teTest (not (identical? :a ::a)))
(teTest (not (identical? false true)))

(checkComplainAndAdjustExpected 31)

(println (teResult))

; see also dot_equals.clj identical?.clj
