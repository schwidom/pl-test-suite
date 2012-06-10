#!/usr/bin/clisp

(setf *print-circle* t)
(setf *print-case* :downcase) 

(require "testenv3.cl")

(defpackage current-test 
 (:import-from testenv3 test testobj)
)

(in-package current-test)

(funcall testobj :check-complain-and-adjust-expected 0)

(let ((v #(4 5 6)))
 (test '(eq 4 (aref v 0)))
 (test '(eq 5 (aref v 1)))
 (test '(eq 6 (aref v 2)))

 (setf (aref v 1) 9)
 (test '(equalp #(4 9 6) v))
)

(funcall testobj :check-complain-and-adjust-expected 4)

; see also array.cl, vector.cl, aref.cl
; see also nth.cl

(print (funcall testobj :result))
