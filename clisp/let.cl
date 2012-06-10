#!/usr/bin/clisp

(setf *print-circle* t)
(setf *print-case* :downcase) 

(require "testenv3.cl")

(defpackage current-test 
 (:import-from testenv3 test testobj)
)

(in-package current-test)

(funcall testobj :check-complain-and-adjust-expected 0)

(let ((a 105))
 (test '(eq 105 a))
 (let (a)
  (test '(not a))
 )
 (test '(eq 105 a))
)

(funcall testobj :check-complain-and-adjust-expected 1)

(print (funcall testobj :result))
