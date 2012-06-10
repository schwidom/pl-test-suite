#!/usr/bin/clisp

(setf *print-circle* t)
(setf *print-case* :downcase) 

(require "testenv3.cl")

(defpackage current-test 
 (:import-from testenv3 test testobj)
)

(in-package current-test)

(funcall testobj :check-complain-and-adjust-expected 0)

(labels ((f () 1))
 (test '(eq 2 (labels ((f-0 () (f)) (f () 2)) (f-0))))
 (test '(eq 1 (flet ((f-0 () (f)) (f () 2)) (f-0))))
)

(funcall testobj :check-complain-and-adjust-expected 2)

(print (funcall testobj :result))
