#!/usr/bin/clisp

(require "testenv2.cl")

(defpackage current-test 
 (:import-from testenv2 test testobj result)
)

(in-package current-test)

(defmacro m args "m does nothing" NIL)

(test '(equal "m does nothing" (documentation 'm 'function)))

(defun f () "f does nothing" NIL)

(test '(equal "f does nothing" (documentation 'f 'function)))

(defun f () (declare) "f does nothing 2" NIL)

(test '(equal "f does nothing 2" (documentation 'f 'function)))

(defun f () "f does nothing 3" (declare) NIL)

(test '(equal "f does nothing 3" (documentation 'f 'function)))

(print (funcall testobj 'result))

