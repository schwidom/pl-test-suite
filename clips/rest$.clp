(batch* "test-env2.clp")

(reset)

(checkComplainAndAdjustExpected 0)

(test (eq (create$ 5 6) (rest$ (create$ 4 5 6))))
(test (eq (create$ 6) (rest$ (create$ 5 6))))
(test (eq (create$) (rest$ (create$ 6))))

(test (eq (create$) (rest$ (create$))))

(checkComplainAndAdjustExpected 4)

(printout t "result: " (result) crlf)
