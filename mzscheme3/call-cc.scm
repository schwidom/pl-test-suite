#!/usr/bin/mzscheme -qr

(load "testenv.scm")

(require testenv)

(checkComplainAndAdjustExpected 0)

(let ((lamb (lambda (lamb-ret) (lamb-ret 2) (lamb-ret 3))))

 (test (eq? 2 (let/cc k (lamb k))))

 (test (eq? 2 (call/cc lamb)))
)

(checkComplainAndAdjustExpected 2)

(display (result))
(newline)

