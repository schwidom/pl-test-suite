#!/usr/bin/mzscheme -qr

(load "testenv.scm")

(require 'testenv)

(require (planet "memoize.ss" ("dherman" "memoize.plt" 2 1))) ; loads module from the planet server

(checkComplainAndAdjustExpected 0)

(define a 1)
(define/memo (f) (set! a (+ 1 a)) a)

(define b 1)
(define (g) (set! b (+ 1 b)) b)

(test (eq? 2 (f)))
(test (eq? 2 (g)))

(test (eq? 2 (f)))
(test (eq? 3 (g)))

(checkComplainAndAdjustExpected 4)

(display (result))
(newline)

