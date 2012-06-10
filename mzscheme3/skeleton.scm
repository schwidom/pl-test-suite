#!/usr/bin/mzscheme -qr

(load "testenv.scm")

(require testenv)

(checkComplainAndAdjustExpected 0)
(test #t)
(checkComplainAndAdjustExpected 1)

(display (result))
(newline)

