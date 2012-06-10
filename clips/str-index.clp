(batch* "test-env2.clp")

(reset)

(checkComplainAndAdjustExpected 0)

(test (eq FALSE (str-index "abc" "a")))
(test (eq 1 (str-index "a" "abc")))
(test (eq 2 (str-index "b" "abc")))

(checkComplainAndAdjustExpected 3)

(printout t "result: " (result) crlf)
