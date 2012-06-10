(batch* "test-env2.clp")

(reset)

(checkComplainAndAdjustExpected 0)

(test (eq a (nth$ 1 (create$ a b c))))
(test (eq b (nth$ 2 (create$ a b c))))
(test (eq c (nth$ 3 (create$ a b c))))

(test (eq nil (nth$ 0 (create$ a b c))))
(test (eq nil (nth$ 4 (create$ a b c))))

(checkComplainAndAdjustExpected 5)

(printout t "result: " (result) crlf)

; see also member$.clp

