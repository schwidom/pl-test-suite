#!/usr/bin/clisp

(setf *print-circle* t)
(setf *print-case* :downcase) 

(require "testenv2.cl")

(defpackage current-test 
 (:import-from testenv2 test testobj result)
)

(in-package current-test)

(setf f-defun (macro-function 'defun))

(eval (funcall f-defun '(defun f-new (x) x) nil))

(test '(functionp #'f-new))
(test '(f-new t))

(print (funcall testobj 'result))
