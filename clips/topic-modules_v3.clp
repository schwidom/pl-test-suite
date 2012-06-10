(batch* "test-env2.clp")

(reset)

(checkComplainAndAdjustExpected 0)

(defmodule MAIN (export ?ALL))

(test (eq MAIN (get-current-module)))

(defclass main ; implicit MAIN::main
 (is-a USER)
 (slot v)
)

(defclass result ; implicit MAIN::result
 (is-a USER)
 (slot v)
)

(test (eq (create$ initial-fact) (get-deftemplate-list)))

(defmodule RESULT (import MAIN deffunction test) (export ?ALL))

(test (eq RESULT (get-current-module)))

(defclass result ; implicit RESULT::result
 (is-a USER)
 (slot v)
)

(defclass main ; implicit RESULT::main
 (is-a USER)
 (slot v)
)

(defrule r1 ; implicit RESULT::r1
 (object (is-a result) (v ?o))
=>
 (test (eq 1 ?o))
)

(test (eq (create$) (get-deftemplate-list)))

;(reset) ; not possible, influences the test environment - tested by hand: reset will not create the initial-fact for other modules but MAIN

(defmodule WORK (import MAIN deftemplate initial-fact) (import MAIN defclass main) (import RESULT defclass result) (import MAIN deffunction test checkComplainAndAdjustExpected) (export ?ALL))

(test (eq WORK (get-current-module)))

(defrule r1 ; implicit WORK::r1
 (object (is-a main) (v ?v))
=>
 (assert (# ?v))
)

(defrule r2 ; implicit WORK::r2
 (# ?v)
=>
 (make-instance of result (v ?v))
)

(set-current-module MAIN)

(make-instance of main (v 1))

(focus WORK RESULT)
;(focus RESULT WORK) ; run will not call (test TRUE) in rule RESULT::r1

(checkComplainAndAdjustExpected 5)

(run)

(checkComplainAndAdjustExpected 1)

(set-current-module MAIN)

(defrule test-state

 (initial-fact) ; inside MAIN
 (object (is-a main) (v 1)) ; inside MAIN

 (not (object (is-a result) (v 1)))

=>
 (test TRUE)
)

(set-current-module RESULT)

(defrule test-state
 
 (object (is-a result) (v 1)) ; inside RESULT

 (not (object (is-a main) (v 1)))
 (not (initial-fact))

=>
 (test TRUE)
)

(set-current-module WORK)

(defrule test-state
 (initial-fact) ; imported from MAIN
 (object (is-a main) (v 1)) ; imported from  MAIN
 (# 1) ; inside WORK
 (object (is-a result) (v 1)) ; imported from RESULT
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
