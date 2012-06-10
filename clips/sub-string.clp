(batch* "test-env2.clp")

(reset)

(checkComplainAndAdjustExpected 0)

(test (eq "" (sub-string 2 -1 "abc")))
(test (eq "" (sub-string 2 0 "abc")))
(test (eq "" (sub-string 2 1 "abc")))
(test (eq "b" (sub-string 2 2 "abc")))
(test (eq "bc" (sub-string 2 3 "abc")))
(test (eq "abc" (sub-string 1 3 "abc")))
(test (eq "abc" (sub-string 0 3 "abc")))
(test (eq "abc" (sub-string -1 3 "abc")))

(checkComplainAndAdjustExpected 8)

(printout t "result: " (result) crlf)
