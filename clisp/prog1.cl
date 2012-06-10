#!/usr/bin/clisp

(setf *print-circle* t)
(setf *print-case* :downcase) 

(require "testenv3.cl")

(defpackage current-test 
 (:import-from testenv3 test testobj)
)

(in-package current-test)

(funcall testobj :check-complain-and-adjust-expected 0)

(test '(eq 1 (prog1 1 2)))

(test '(eq 1 (prog1 (- 2 1) (- 5 3))))

(test '(eq 2 (prog2 1 2)))

(test '(eq 2 (prog2 (- 2 1) (- 5 3))))


(funcall testobj :check-complain-and-adjust-expected 4)

; see also: prog prog* prog1 prog2 progn

(print (funcall testobj :result))
