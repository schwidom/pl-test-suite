#!/usr/bin/clisp

(setf *print-circle* t)
(setf *print-case* :downcase) 

(require "testenv3.cl")

(defpackage current-test 
 (:import-from testenv3 test testobj)
)

(in-package current-test)

(funcall testobj :check-complain-and-adjust-expected 0)

(defpackage a)
(in-package a)

(defun :f () 102)

(in-package current-test)

(test '(eq 102 (:f)))

(funcall testobj :check-complain-and-adjust-expected 1)

(print (funcall testobj :result))
