#!/usr/bin/clisp

(require "testenv2.cl")

(defpackage current-test 
 (:import-from testenv2 test testobj result)
)

(in-package current-test)

;; aus /home/fschwidom/source/clisp-2.41/src/edit.lisp

(defun f NIL)
(defmacro m NIL)

(test '(equal '(defun f NIL) (car (get 'f 'sys::definition))))
(test '(equal '(defmacro m NIL) (car (get 'm 'sys::definition))))

(print (funcall testobj 'result))
