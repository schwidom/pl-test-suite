(batch* "test-env2.clp")

(reset)

(checkComplainAndAdjustExpected 0)

(open "work/tmp.txt" fdesc "w")
(printout fdesc "hello")
(printout fdesc " ")
(printout fdesc "world" crlf)
(close fdesc)

(open "work/tmp.txt" fdesc "r")
(test (eq "hello world EOF" (str-cat (read fdesc) " " (read fdesc) " " (read fdesc))))
(close fdesc)

(open "work/tmp.txt" fdesc "r")
(test (eq "hello world" (readline fdesc)))
(close fdesc)

(checkComplainAndAdjustExpected 2)

(printout t "result: " (result) crlf)
