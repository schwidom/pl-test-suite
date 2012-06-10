#!/usr/bin/clisp

(require "testenv2.cl")

(defpackage current-test 
 (:import-from testenv2 test testobj result)
 (:import-from ext eval-env the-environment)
)

(in-package current-test)

(let ((a 1))
 ; (eval-env '(test '(eq 1 a))) ; EVAL: Die Variable A hat keinen Wert.
 (eval-env '(test '(eq 1 a)) (the-environment))
)

(setf a 1)

(eval-env '(test '(eq 1 a)))

(print (funcall testobj 'result))
