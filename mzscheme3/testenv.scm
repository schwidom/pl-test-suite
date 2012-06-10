(module testenv mzscheme

 (define countOk 0)
 (define countFail 0)
 (define countLatest 0)


 (provide test)
 (define (test x)
  (if x
   (set! countOk (add1 countOk))
   (begin
    (set! countFail (add1 countFail))
    ; baustelle : trace
    (display "test failed")(newline)
   )
  )
 )

 (provide checkComplainAndAdjustExpected)
 (define (checkComplainAndAdjustExpected count)
  (let*
   (
    (countTests (+ countOk countFail))
    (countTestsLocal (- countTests countLatest))
   )

   (set! countLatest countTests)

   (if (= count countTestsLocal)
    #t
    (begin
     ; baustelle : trace
     (display (format "Expected Test Count (from last checkpoint to here) doesn't match: countTestsLocal: ~s count: ~s ~%" countTestsLocal count))
     #f
    )
   )
  )
 )

 (provide result)
 (define (result)
  (format "tests: ok: ~s fail: ~s countLatest: ~s" countOk countFail countLatest)
 )
)
