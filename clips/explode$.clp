(batch* "test-env2.clp")

(reset)

(checkComplainAndAdjustExpected 0)

(test (eq (create$ a b c) (explode$ "a  b c")))
(test (eq "a b c" (implode$ (create$ a b c))))

(test (eq "a b c" (implode$ (explode$ "a b c"))))
(test (eq (create$ a b c) (explode$ (implode$ (create$ a b c)))))

(checkComplainAndAdjustExpected 2)

(printout t "result: " (result) crlf)

; see also : create$.clp, explode$.clp, implode$.clp
