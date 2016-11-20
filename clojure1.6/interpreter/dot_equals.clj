

(ns dot_equals-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

; (teTest (.equals nil nil)) ; 11v1smec97 ; java.lang.NullPointerException
; (teTest (.equals nil 'nil)) ; java.lang.NullPointerException
; (teTest (.equals 'nil 'nil)) ; java.lang.NullPointerException
(teTest (.equals '() '())) ; ds15wqov6l 
(teTest (.equals [] [])) ; ds15wqov6l 
(teTest (.equals {} {})) ; ds15wqov6l 
(teTest (.equals #{} #{})) ; ds15wqov6l 
(teTest (.equals true true))
(teTest (.equals false false))
(teTest (.equals 1 1))
(teTest (.equals 1 '1))
(teTest (.equals :a :a))
(teTest (.equals ::a ::a))

; (teTest (.equals nil (seq nil))) ; java.lang.NullPointerException
; (teTest (.equals nil (seq '()))) ; java.lang.NullPointerException
; (teTest (.equals nil (seq []))) ; java.lang.NullPointerException
; (teTest (.equals nil (seq #{}))) ; java.lang.NullPointerException
; (teTest (.equals nil (seq {}))) ; java.lang.NullPointerException

(def ide identity)

(teTest (ide (.equals 0N 0N))) ; ?
(teTest (ide (.equals 1N 1N))) ; ?
(teTest (ide (.equals 0.0 0.0)))
(teTest (ide (.equals 1.0 1.0)))
(teTest (ide (.equals 1.1 1.1)))
(teTest (ide (.equals 'a 'a)))

(teTest (not (.equals '() nil))) ; 11v1smec97
(teTest (ide (.equals '() []))) ; ds15wqov6l 


(teTest (not (identical? (cons 1 nil) (cons 1 nil))))

(teTest (ide (.equals '(1) '(1)))) ; ds15wqov6l
(teTest (ide (.equals [1] [1]))) ; ds15wqov6l 
(teTest (ide (.equals {:a 1} {:a 1}))) ; ds15wqov6l 
(teTest (ide (.equals #{1} #{1}))) ; ds15wqov6l 

(teTest (ide (.equals '(1) [1]))) ; 
(teTest (not (.equals '(1) #{1}))) ; 
(teTest (not (.equals [1] #{1}))) ; 

(teTest (not (.equals :a ::a)))
(teTest (not (.equals false true)))

(checkComplainAndAdjustExpected 28)

(println (teResult))

; see also dot_equals.clj identical?.clj
