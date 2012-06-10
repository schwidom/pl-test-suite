#!/usr/bin/mzscheme -qr

(load "testenv.scm")

(require testenv)

(checkComplainAndAdjustExpected 0)
(test #t)
(test #t)
(checkComplainAndAdjustExpected 2)
(test #t)
(test #t)
(test #t)
(checkComplainAndAdjustExpected 3)

(display (result))
(newline)

