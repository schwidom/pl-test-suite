(batch* "test-env2.clp")

(reset)

(checkComplainAndAdjustExpected 0)

(defmodule MAIN (export ?ALL))

(test (eq MAIN (get-current-module)))

(deftemplate main ; implicit MAIN::main
 (slot v)
)

(test (eq (create$ initial-fact main) (get-deftemplate-list)))

(defmodule RESULT (import MAIN deffunction test) (export ?ALL))

(test (eq RESULT (get-current-module)))

(deftemplate result ; implicit RESULT::result
 (slot v)
)

(defrule r1 ; implicit RESULT::r1
 (result (v ?o))
=>
 (test (eq 1 ?o))
)

(test (eq (create$ result) (get-deftemplate-list)))

;(reset) ; not possible, influences the test environment - tested by hand: reset will not create the initial-fact for other modules but MAIN

(defmodule WORK (import MAIN ?ALL) (import RESULT ?ALL) (export ?ALL))

(test (eq WORK (get-current-module)))

(defrule r1 ; implicit WORK::r1
 (main (v ?v))
=>
 (assert (# ?v))
)

(defrule r2 ; implicit WORK::r2
 (# ?v)
=>
 (assert (result (v ?v)))
)

(set-current-module MAIN)

(assert (main (v 1)))

(focus WORK RESULT)
;(focus RESULT WORK) ; run will not call (test TRUE) in rule RESULT::r1

(checkComplainAndAdjustExpected 5)

(run)

(checkComplainAndAdjustExpected 1)

(set-current-module MAIN)

(defrule test-state
 (initial-fact) ; inside MAIN
 (main (v 1)) ; inside MAIN
=>
 (test TRUE)
)

(set-current-module RESULT)

(defrule test-state

 (result (v 1)) ; inside RESULT
=>
 (test TRUE)
)

(set-current-module WORK)

(defrule test-state
 (initial-fact) ; imported from MAIN
 (main (v 1)) ; imported from  MAIN
 (# 1) ; inside WORK
 (result (v 1)) ; imported from RESULT
=>
 (test TRUE)
)

(test (eq (create$) (get-focus-stack)))

(focus MAIN) ; calls only 1 rule

(test (eq (create$ MAIN) (get-focus-stack)))

(focus WORK) ; now it calls 2 rules

(test (eq (create$ WORK MAIN) (get-focus-stack)))

(focus RESULT) ; now it calls all 3 test-state rules

(test (eq (create$ RESULT WORK MAIN) (get-focus-stack)))

;(focus MAIN WORK RESULT) ; works
;(focus WORK RESULT MAIN) ; works
;(focus RESULT MAIN WORK); works

(run)

(set-current-module MAIN)

(checkComplainAndAdjustExpected 7)

(printout t "result: " (result) crlf)
