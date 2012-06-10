#!/usr/bin/mzscheme -qr

(load "testenv.scm")

(require testenv)

(checkComplainAndAdjustExpected 0)

(let ((result1 (list "root")) (result2 '#f))

 (test (void?
   (do ( [a 1 (+ 1 a)]) ((= 10 a) (set! result2 a)) (append! result1 (list a)))
 ))

 (test (equal? '("root" 1 2 3 4 5 6 7 8 9) result1))
 (test (equal? 10 result2))
)

(checkComplainAndAdjustExpected 3)

(display (result))
(newline)

