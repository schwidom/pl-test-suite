#!/usr/bin/clisp

(setf *print-circle* t)
(setf *print-case* :downcase) 

(require "testenv3.cl")

(defpackage current-test 
 (:import-from testenv3 test testobj)
)

(in-package current-test)

(funcall testobj :check-complain-and-adjust-expected 0)

(let ((l '(4 5 6)))
 (test '(eq 4 (nth 0 l)))
 (test '(eq 5 (nth 1 l)))
 (test '(eq 6 (nth 2 l)))

 (setf (nth 1 l) 9)
 (test '(equal '(4 9 6) l))
)

(funcall testobj :check-complain-and-adjust-expected 4)

;see also aref.cl

(print (funcall testobj :result))
