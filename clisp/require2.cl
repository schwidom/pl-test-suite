#!/usr/bin/clisp

(setf *print-circle* t)
(setf *print-case* :downcase) 

(require "testenv3.cl")
(require "defines-constant.cl")
(require "defines-constant.cl")

(defpackage current-test 
 (:import-from testenv3 test testobj)
 (:import-from defines-constant +DEFINED-CONSTANT-I+)
)

(in-package current-test)

(funcall testobj :check-complain-and-adjust-expected 0)

(test '(eq 2 +DEFINED-CONSTANT-I+))

(funcall testobj :check-complain-and-adjust-expected 1)

; see prev require1.cl
; see next provide2.cl

(print (funcall testobj :result))

