#!/usr/bin/mzscheme -qr

(load "testenv.scm")

(require 'testenv)

(checkComplainAndAdjustExpected 0)

(test (void? (case 2 ('1 (test #f) 2) ('1 (test #f) 1))))
(test (eq? 3 (case 2 ('1 (test #f) 2) ('1 (test #f) 1) (else (test #t) 3))))
(test (eq? 2 (case 1 ('1 (test #t) 2) ('1 (test #f) 1))))
(test (eq? 1 (case 1 ('1 (test #t) 1) ('1 (test #f) 2))))

(checkComplainAndAdjustExpected 7)

(test (void? (case 1 ((3 2) (test #f) 1))))
(test (eq? 1 (case 1 ((3 2 1) (test #t) 1))))

(checkComplainAndAdjustExpected 3)

;(test (eq? 1 [case "a" ("a" 1)])) ; case: bad syntax (not a datum sequence) at: "a" 

(test (void? [case '(1 2) ('(1 2) 1)]))

(let ((x '(1 2)))
 ; (test (eq? 1 [case x (x 1)])) ; case: bad syntax (not a datum sequence) at: x
 #f
)

(test (void? [case '(1 2) ('1 1)]))
(test (void? [case '(1 2) ('2 1)]))

(checkComplainAndAdjustExpected 3)

(test (eq? 1 [case '#:a ('#:a 1)]))
(test (eq? 1 [case 'a ('a 1)]))

(test (void? [case "a" ('"a" 1)]))
(test (void? [case '"a" ('"a" 1)]))
(test (void? [case null ('null 1)]))
(test (eq? 1 [case #t ('#t 1)]))
(test (eq? 1 [case #f ('#f 1)]))
(test (void? [case #f ('#t 1)]))
(test (void? [case void ('void 1)]))

(checkComplainAndAdjustExpected 9)

(display (result))
(newline)

