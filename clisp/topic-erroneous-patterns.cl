#!/usr/bin/clisp

(setf *print-circle* t)
(setf *print-case* :downcase) 

(require "testenv3.cl")

(defpackage current-test 
 (:import-from testenv3 test testobj)
)

(in-package current-test)

(funcall testobj :check-complain-and-adjust-expected 0)

(print "list of erroneous patterns, not executable. exiting now.")
(ext:quit)

(let ((a 1)) (macrolet ((m () a)) (m))) ; this error cannot be handled per handler-bind

(funcall testobj :check-complain-and-adjust-expected 0)

(print (funcall testobj :result))
