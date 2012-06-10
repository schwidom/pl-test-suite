(batch* "test-env2.clp")

(reset)

(checkComplainAndAdjustExpected 0)

(open "testdata.txt" td "r")

(progn
 (bind ?a (readline td))
 (bind ?b (readline td))
 
 (test (eq "aa b 1 , : :: ( ; c" ?a)) ; )
 (test (eq "d e 2 ff" ?b))
)

(close td)

(checkComplainAndAdjustExpected 2)

(printout t "result: " (result) crlf)
