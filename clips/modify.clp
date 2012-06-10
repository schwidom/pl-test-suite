(batch* "test-env2.clp")

(reset)

(checkComplainAndAdjustExpected 0)

(defclass C (is-a USER) (slot s) (multislot ms))

(make-instance of C)

(defrule r-C

 ?i <- (object (is-a C) (s ?x&nil))

=>

 (modify-instance ?i (s 2))
 (test TRUE)
)

(deftemplate T (slot s) (multislot ms))

(assert (T))

(defrule r-T

 ?o <- (T (s ?x&nil))

=>

 (modify ?o (s 2))
 (test TRUE)
)

(run)

(checkComplainAndAdjustExpected 2)

(printout t "result: " (result) crlf)
