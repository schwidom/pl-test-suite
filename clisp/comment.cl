#!/usr/bin/clisp

(setf *print-circle* t)
(setf *print-case* :downcase) 

(require "testenv3.cl")

(defpackage current-test 
 (:import-from testenv3 test testobj)
)

(in-package current-test)

(funcall testobj :check-complain-and-adjust-expected 0)

; this is a comment

#|
 this is a comment
|#

(funcall testobj :check-complain-and-adjust-expected 0)

(print (funcall testobj :result))
