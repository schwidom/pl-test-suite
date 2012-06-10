#!/usr/bin/mzscheme -qr

(load "testenv.scm")

(require testenv)

(load "testdata.scm")

(checkComplainAndAdjustExpected 0)

(test (void? (void)))

(test (void? (void (list-ref random-objects (random random-objects-length)))))

(test (primitive? void))
(test (not (primitive? (void))))

(test (boolean? #t))
(test (boolean? #f))

(test (null? null))

(test (list? null))
(test (list? '()))
(test (equal? (cons 1 2) (list* 1 2))) ; baustelle : gehoert nicht hierher
(test (list? '(1 2)))
(test (not (vector? '(1 2))))

(test (char? #\a))
(test (char-lower-case? #\a))
(test (char-upper-case? #\A))
(test (char-numeric? #\1))

(test (string? ""))

(test (symbol? 'a))

(test (not (symbol? #:a)))
(test (keyword? #:a))

(test (not (list? #())))
(test (vector? #()))

(test (box? (box void)))
(test (hash-table? (make-hash-table)))

(test (promise? (delay (test #f))))

; primitive-closure?

;char-symbolic?

;immutable?

(checkComplainAndAdjustExpected 25)

(display (result))
(newline)

