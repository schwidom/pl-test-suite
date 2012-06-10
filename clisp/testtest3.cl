#!/usr/bin/clisp

(setf *print-circle* t)
(setf *print-case* :downcase) 

(require "testenv3.cl")

(defpackage current-test 
 (:import-from testenv3 test testobj)
)

(in-package current-test)

(funcall testobj :check-complain-and-adjust-expected 0)
(test 't)
(test 't)
(funcall testobj :check-complain-and-adjust-expected 2)
(test 't)
(test 't)
(test 't)
(funcall testobj :check-complain-and-adjust-expected 3)

(print (funcall testobj :result))
