#!/usr/bin/clisp

(setf *print-circle* t)
(setf *print-case* :downcase) 

(require "testenv3.cl")

(defpackage current-test 
 (:import-from testenv3 test testobj)
)

(in-package current-test)

(funcall testobj :check-complain-and-adjust-expected 0)

(test '(eq nil (prog () 1)))
(test '(eq 1 (prog () (return 1))))

(test '(eq 1 (prog ((a 1)) (return a))))

(funcall testobj :check-complain-and-adjust-expected 3)

; see also: prog prog* prog1 prog2 progn

(print (funcall testobj :result))
