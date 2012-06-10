#!/usr/bin/clisp

(require "testenv2.cl")

(defpackage current-test 
 (:import-from testenv2 test testobj result)
)

(in-package current-test)


(defmacro m1 (&rest r) `(list ,@r))

(test '(equal '(1 2 a) (m1 1 2 'a)))

(defmacro m2 (&rest r) `'(,@r))

(test '(equal '(1 2 a) (m2 1 2 a)))

; tags : macro-lambda-lists

(print (funcall testobj 'result))
