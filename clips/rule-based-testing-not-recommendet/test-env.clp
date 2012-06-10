
(deftemplate test-env-variables ""
 (slot countOk (type INTEGER) (default 0))
 (slot countFail (type INTEGER) (default 0))
 (slot countLatest (type INTEGER) (default 0))
 (slot result (type STRING) (default ""))
)

(deffacts test-env-facts
 (test-env-variables)
)

(defrule test-env-rule-test
 ?variables <- (test-env-variables (countOk ?countOk) (countFail ?countFail))
 ?test <- (test-env test ?boolean $?localname)

=>

 (if (eq TRUE ?boolean) 
  then
   (modify ?variables (countOk (+ 1 ?countOk)))
  else
   (modify ?variables (countFail (+ 1 ?countFail)))
   (printout t "test failed on " $?localname crlf)
 )

 (retract ?test)
)

(defrule test-env-rule-checkComplainAndAdjustExpected
 ?variables <- (test-env-variables (countOk ?countOk) (countFail ?countFail) (countLatest ?countLatest)) 
 ?checkComplainAndAdjustExpected <- (test-env checkComplainAndAdjustExpected ?count $?localname) 

=>

 (bind ?countTests (+ ?countOk ?countFail))
 (bind ?countTestsLocal (- ?countTests ?countLatest))

 (modify ?variables (countLatest ?countTests))

 (if (eq ?count ?countTestsLocal)
  then
  else
   (printout t "Expected Test Count in localname: " ?localname " (from last checkpoint to here) doesn't match: countTestsLocal:" ?countTestsLocal " count: " ?count crlf)
 )

 (retract ?checkComplainAndAdjustExpected)
)

(defrule test-env-rule-result
 ?result-fact <- (test-env result $?localname)
 ?variables <- (test-env-variables (countOk ?countOk) (countFail ?countFail) (countLatest ?countLatest) (result ?result))
=>

 (modify ?variables (result (str-cat "in localname: (" (implode$ $?localname) "): tests: ok: " ?countOk " countFail: " ?countFail " countLatest: " ?countLatest)))

 (retract ?result-fact)
)
 
