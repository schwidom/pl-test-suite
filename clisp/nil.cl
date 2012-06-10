#!/usr/bin/clisp

(require "testenv2.cl")

(defpackage current-test 
 (:import-from testenv2 test testobj result)
)

(in-package current-test)

(test '(eq nil (null 1)))
(test '(eq nil (null 2)))
(test '(eq nil (null 3)))
(test '(eq 'null (type-of nil)))

(print (funcall testobj 'result))
