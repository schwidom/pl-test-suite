#!/usr/bin/clisp

(setf *print-circle* t)
(setf *print-case* :downcase) 

(require "testenv3.cl")

(defpackage current-test 
 (:import-from testenv3 test testobj)
)

(in-package current-test)

(funcall testobj :check-complain-and-adjust-expected 0)



(let ((a (complex 0 1)))
 (test '(equal a (complex 0 1)))
 (test '(eql a (complex 0 1)))
 (test '(eq -1 (* a a)))
)

(funcall testobj :check-complain-and-adjust-expected 3)

(print (funcall testobj :result))
