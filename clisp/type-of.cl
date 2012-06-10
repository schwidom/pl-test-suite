#!/usr/bin/clisp

(require "testenv2.cl")

(defpackage current-test 
 (:import-from testenv2 test testobj result)
)

(in-package current-test)

(test '(functionp (symbol-function 'type-of)))

(test '(eq 'STANDARD-CHAR (type-of #\0)))
(test '(eq 'STANDARD-CHAR (type-of '#\0)))
(test '(eq 'CONS (type-of '(1 2 3))))
(test '(eq 'KEYWORD (type-of :)))
(test '(eq 'KEYWORD (type-of ':a)))
(test '(eq 'KEYWORD (type-of :a)))
(test '(eq 'SYMBOL (type-of 'a)))
(test '(equal '(SIMPLE-BASE-STRING 1) (type-of '"a")))
(test '(equal '(SIMPLE-BASE-STRING 1) (type-of "a")))
(test '(equal '(SIMPLE-VECTOR 3) (type-of '#(1 2 3))))
(test '(equal '(SIMPLE-VECTOR 3) (type-of #(1 2 3))))
(test '(equal '(INTEGER 0 16777215) (type-of '10)))
(test '(equal '(INTEGER 0 16777215) (type-of 10)))
(test '(equal 'BIT (type-of '1)))
(test '(equal 'BIT (type-of -0)))
(test '(equal '(SIMPLE-BIT-VECTOR 4) (type-of '#*1011)))
(test '(equal '(SIMPLE-BIT-VECTOR 4) (type-of #*1011)))

; siehe auch sharpsign.cl

(print (funcall testobj 'result))
