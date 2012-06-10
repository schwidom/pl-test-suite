#!/usr/bin/mzscheme -qr

(load "testenv.scm")

(require 'testenv)

(checkComplainAndAdjustExpected 0)

(let ((lamb (lambda (lamb-ret) (test #t) (lamb-ret 2) (test #f) (lamb-ret 3))))

 (test (eq? 2 (let/cc k (lamb k))))

 (test (eq? 2 (call/cc lamb)))
)

(checkComplainAndAdjustExpected 4)

(display (result))
(newline)

