#!/usr/bin/clisp

(setf *print-circle* t)
(setf *print-case* :downcase) 

(require "testenv3.cl")

(defpackage current-test 
 (:import-from testenv3 test testobj)
)

(in-package current-test)

(funcall testobj :check-complain-and-adjust-expected 0)

(setf a 1)
(load "require3_this.cl")
(test '(eq 2 b))

(funcall testobj :check-complain-and-adjust-expected 2)

(print (funcall testobj :result))
