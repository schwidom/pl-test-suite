(batch* "test-env2.clp")

(reset)

(checkComplainAndAdjustExpected 0)

; this is a line comment (printout t "1" crlf)
# this is a line comment (printout t "2" crlf)
; there is no block comment available

(checkComplainAndAdjustExpected 0)

(printout t "result: " (result) crlf)
