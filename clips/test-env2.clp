
; (deftemplate test-env-variables "")
;(defclass test-env-variables (role concrete))
(defclass TEST-ENV-VARIABLES (is-a USER) (role concrete)
 (slot countOk (type INTEGER) (default 0))
 (slot countFail (type INTEGER) (default 0))
 (slot countLatest (type INTEGER) (default 0))
 (slot result (type STRING) (default ""))
)

;(defglobal ?*b* = 2)
;(defglobal ?*test-env-variables* = (make-instance test-env-variables))
;(make-instance TE of TEST-ENV-VARIABLES)
(definstances te
 (TE of TEST-ENV-VARIABLES)
)

; (describe-class TEST-ENV-VARIABLES)

;(reset)
;(instances)
;(send [TE] print)
;(printout t (send [TE] get-result) crlf)
;(send [TE] put-result "a")
;(printout t (send [TE] get-result) crlf)

(deffunction test (?boolean)
 (if (eq TRUE ?boolean) 
  then
   (send [TE] put-countOk (+ 1 (send [TE] get-countOk)))
   (return TRUE)
  else
   (send [TE] put-countFail (+ 1 (send [TE] get-countFail)))
   (printout t "test failed " crlf)
   (return FALSE)
 )
)

(deffunction checkComplainAndAdjustExpected (?count)

 (bind ?countOk (send [TE] get-countOk))
 (bind ?countFail (send [TE] get-countFail))
 (bind ?countLatest (send [TE] get-countLatest))

 (bind ?countTests (+ ?countOk ?countFail))
 (bind ?countTestsLocal (- ?countTests ?countLatest))

 (send [TE] put-countLatest ?countTests)

 (if (eq ?count ?countTestsLocal)
  then
   (return TRUE)
  else
   (printout t "Expected Test Count (from last checkpoint to here) doesn't match: countTestsLocal:" ?countTestsLocal " count: " ?count crlf)
   (return FALSE)
 )
)

(deffunction result ()
 (return (str-cat "tests: ok: " (send [TE] get-countOk) " countFail: " (send [TE] get-countFail) " countLatest: " (send [TE] get-countLatest)))
)

