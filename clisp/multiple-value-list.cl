#!/usr/bin/clisp

(setf *print-circle* t)
(setf *print-case* :downcase) 

(require "testenv3.cl")

(defpackage current-test 
 (:import-from testenv3 test testobj)
)

(in-package current-test)

(funcall testobj :check-complain-and-adjust-expected 0)

(test '(equal '(1 2 3) (multiple-value-list (values 1 2 3))))
(test '(equal '(1 2 3) (multiple-value-list (multiple-value-call #'values 1 2 3))))

(funcall testobj :check-complain-and-adjust-expected 2)

; see also : multiple-value-call.cl, values.cl

(print (funcall testobj :result))
