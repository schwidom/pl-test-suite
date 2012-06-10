#!/usr/bin/clisp

(require "testenv2.cl")

(defpackage current-test 
 (:import-from testenv2 test testobj result)
)

(in-package current-test)

(defun f (a) (* a a))

(test '(eq 9 (f 3)))

(test '(equal '(LAMBDA (A) (DECLARE (SYSTEM::IN-DEFUN F)) (BLOCK F (* A A))) (function-lambda-expression #'f)))

(eval `(defun g ,@(cdr (function-lambda-expression #'f))))

(test '(eq 9 (g 3)))

(test '(equal '(LAMBDA (A) (DECLARE (SYSTEM::IN-DEFUN G) (SYSTEM::IN-DEFUN F)) (BLOCK G (BLOCK F (* A A)))) (function-lambda-expression #'g)))


(print (funcall testobj 'result))
