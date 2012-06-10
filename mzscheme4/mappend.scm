#!/usr/bin/mzscheme -qr

(load "testenv.scm")

(require 'testenv)

(require scheme/mpair)

(checkComplainAndAdjustExpected 0)

(let
 (
  (a (mlist))
  (b (mlist 1))
 )

 (test (equal? '(2) (mappend! a (list 2))))
 (test (equal? (mlist 2) (mappend! a (mlist 2))))
 (test (equal? (mlist 1 2) (mappend! b (mlist 2))))

 (test (equal? null a))
 (test (equal? (mlist 1 2) b))

)

(checkComplainAndAdjustExpected 5)

(let
 (
  (a (mlist))
  (b (mlist 1))
 )

 (test (equal? '(2) (mappend a (list 2))))
 (test (equal? (mlist 2) (mappend a (mlist 2))))
 (test (equal? (mlist 1 2) (mappend b (mlist 2))))

 (test (equal? null a))
 (test (equal? (mlist 1) b))

)

(checkComplainAndAdjustExpected 5)

(display (result))
(newline)

