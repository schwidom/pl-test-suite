#!/usr/bin/clisp

(require "testenv2.cl")

(defpackage current-test 
 (:import-from testenv2 test testobj result)
)

(in-package current-test)

(test '(functionp (symbol-function 'nconc)))

(defvar *l1* '(root))

(nconc *l1* '(1 2 3))

(test '(equal '(root 1 2 3) *l1*))

(defvar *l2* '())

(nconc *l1* '(1 2 3))

(test '(equal '() *l2*))

(print (funcall testobj 'result))
