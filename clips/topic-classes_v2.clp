(batch* "test-env2.clp")

(reset)

(checkComplainAndAdjustExpected 0)

(defclass C (is-a USER) (slot c) (slot rekdepth (default 0)))

(definstances i1
 (of C)
)

(defrule r1
 ?o <- (object (is-a C) (rekdepth ?r&:(< ?r 2)))
=>
 (duplicate-instance ?o
  (c ?o)
  (rekdepth (+ 1 ?r))
 )
)

(reset)
(run)
;(facts)
;(instances)
;(agenda)

(defrule r2
 ?o <- (object (is-a C) (c ?c))
=>
 (test (eq C (class ?o)))
)

(run)

(checkComplainAndAdjustExpected 3)

(deffunction has-c (?o)
 (and
  (eq C (class ?o))
  (eq C (class (send ?o get-c)))
 )
)

(defrule r3
 ?o <- (object (is-a C))
 (test (has-c ?o))
=>
 (test (eq C (class ?o)))
)

(run)

(checkComplainAndAdjustExpected 2)

(defrule r3-2
 ?c <- (object (is-a C))
 ?o <- (object (is-a C) (c ?c))
=>
 (test TRUE)
)

(run)

(checkComplainAndAdjustExpected 2)

(deffunction has-cc (?o)
 (and
  (eq C (class ?o))
  (eq C (class (send ?o get-c)))
  (eq C (class (send (send ?o get-c) get-c)))
 )
)

(defrule r4
 ?o <- (object (is-a C))
 (test (has-cc ?o))
=>
 (test (eq C (class ?o)))
)

(run)

(checkComplainAndAdjustExpected 1)

(defrule r4-2
 ?c2 <- (object (is-a C))
 ?c1 <- (object (is-a C) (c ?c2))
 ?o <- (object (is-a C) (c ?c1))
=>
 (test TRUE)
)

(run)

(checkComplainAndAdjustExpected 1)

(printout t "result: " (result) crlf)
