#!/usr/bin/clisp

(setf *print-circle* t)
(setf *print-case* :downcase) 

(require "testenv3.cl")

(defpackage current-test 
 (:import-from testenv3 test testobj)
)

(in-package current-test)

(funcall testobj :check-complain-and-adjust-expected 0)

(test '(symbolp (macro-function 'apply)))
(test '(not (symbolp (symbol-function 'apply))))

(test '(eq 3 (apply #'+ '(1 2))))

(test '(eq 10 (apply #'+ '(1 2 3 4))))

(test '(eq 10 (apply #'+ 1 '(2 3 4))))
(test '(eq 10 (apply #'+ 1 2 '(3 4))))
(test '(eq 10 (apply #'+ 1 2 3 '(4))))
(test '(eq 10 (apply #'+ 1 2 3 4 '())))

(funcall testobj :check-complain-and-adjust-expected 8)

; see also apply.cl, funcall.cl

(print (funcall testobj :result))
