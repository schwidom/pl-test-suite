(batch* "test-env2.clp")

(reset)

(checkComplainAndAdjustExpected 0)

(open "testdata.txt" td "r")

(progn
 (bind ?a (read td))
 (bind ?b (read td))
 (bind ?c (read td))
 (bind ?d (read td))
 (bind ?e (read td))
 (bind ?f (read td))
 (bind ?g (read td))
 (bind ?h (read td))
 
 (test (eq aa ?a))
 (test (eq b ?b))
 (test (eq 1 ?c))
 (test (eq , ?d))
 (test (eq : ?e))
 (test (eq :: ?f))
 ;(test (eq \( ?g)) ; )
 (test (eq "(" (format nil "%s" ?g))) ; found no possibility to express the symbol "(" )) 
 ; ";" and "c"  dont appear because ; stands for comment
 (test (eq d ?h))
)

(close td)

(checkComplainAndAdjustExpected 8)

(printout t "result: " (result) crlf)
