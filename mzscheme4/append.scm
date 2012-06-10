#!/usr/bin/mzscheme -qr

(load "testenv.scm")

(require 'testenv)

(checkComplainAndAdjustExpected 0)

(let
 (
  (a (list))
  (b (list 1))
 )

 (test (equal? '(2) (append a (list 2))))
 (test (equal? '(1 2) (append b (list 2))))

 (test (equal? null a))
 (test (equal? '(1) b))

)

(checkComplainAndAdjustExpected 4)

(display (result))
(newline)

