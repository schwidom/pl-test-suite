#!/usr/bin/clisp

(setf *print-circle* t)
(setf *print-case* :downcase) 

(require "testenv3.cl")

(defpackage current-test 
 (:import-from testenv3 test testobj)
)

(in-package current-test)

(funcall testobj :check-complain-and-adjust-expected 0)

(test '(not (functionp (symbol-function 'when))))
(test '(functionp (macro-function 'when)))

(funcall testobj :check-complain-and-adjust-expected 2)

(test '(eq 1 (when T 1)))
(test '(eq 1 (when T 2 1)))

(setf cnt 0)

(test '(eq 1 (when T (progn (incf cnt) 2) (progn (incf cnt) 1))))
(test '(eq 2 cnt))

(test '(eq NIL (when NIL (progn (incf cnt) 2) (progn (incf cnt) 1))))
(test '(eq 2 cnt))

(funcall testobj :check-complain-and-adjust-expected 6)

; see also unless.cl, when.cl

(print (funcall testobj :result))

