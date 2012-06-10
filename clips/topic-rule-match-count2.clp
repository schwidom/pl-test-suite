(batch* "test-env2.clp")

(reset)

(checkComplainAndAdjustExpected 0)

(deftemplate # (multislot ms))

(assert (# (ms a b)))

(defrule r1
 (# (ms $?x $?y))
=>
 (test TRUE)
)

(run)

(checkComplainAndAdjustExpected 3)

;(defrule r2
; (# (ms $?x $?y) (ms $?a $?b)) ; The slot ms has already been parsed
;=>
; (test TRUE)
;)

(printout t "result: " (result) crlf)
