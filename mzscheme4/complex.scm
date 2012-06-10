#!/usr/bin/mzscheme -qr

(load "testenv.scm")

(require 'testenv)

(checkComplainAndAdjustExpected 0)

(let ((a 0+1i))
 (test (eq? a a))
 (test (eq? -1 (* a a)))
 (test (eq? 0 (real-part a)))
 (test (eq? 1 (imag-part a)))
)

(checkComplainAndAdjustExpected 4)

(display (result))
(newline)

