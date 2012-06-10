#!/usr/bin/mzscheme -qr

(load "testenv.scm")

(require 'testenv)

(checkComplainAndAdjustExpected 0)


(define r #f)

(let () (call/cc (lambda (k) (set! r k) #t)) (test #t))

(checkComplainAndAdjustExpected 1)

(r #t)
(r #t)
(r #t)

(checkComplainAndAdjustExpected 3)

(display (result))
(newline)

