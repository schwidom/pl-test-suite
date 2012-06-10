(batch* "test-env2.clp")

(reset)

(checkComplainAndAdjustExpected 0)

(test (= 1 (member$ a (create$ a b c))))
(test (= 2 (member$ b (create$ a b c))))
(test (= 3 (member$ c (create$ a b c))))

(test (not (member$ d (create$ a b c))))

(checkComplainAndAdjustExpected 4)

(printout t "result: " (result) crlf)

; see also nth$.clp

