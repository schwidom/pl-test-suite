#!/usr/bin/mzscheme -qr

(load "testenv.scm")

(require testenv)

(checkComplainAndAdjustExpected 0)

(test (= 2
  (dynamic-wind
   (lambda () (test #t) 1)
   (lambda () (test #t) 2)
   (lambda () (test #t) 3)
  )
))

(checkComplainAndAdjustExpected 4)

(test (= 1
  (call/cc (lambda (ret)
    (dynamic-wind 
     void
     (lambda () (test #t) (ret 1))
     (lambda () (test #t))
    )
  ))
))

(checkComplainAndAdjustExpected 3)

(test (= 2
  (call/cc (lambda (ret)
    (dynamic-wind 
     void
     (lambda () (test #t) (ret 1))
     (lambda () (test #t) (ret 2))
    )
  ))
))

(checkComplainAndAdjustExpected 3)

(display (result))
(newline)

