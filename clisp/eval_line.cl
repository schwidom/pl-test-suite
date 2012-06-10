#!/usr/bin/clisp

(require "testenv2.cl")

(defpackage current-test 
 (:import-from testenv2 test testobj result)
)

(in-package current-test)

(test '(functionp (symbol-function 'eval)))

(setf code `(list
,system::*current-source-line-1*
,system::*current-source-line-2*
system::*current-source-line-1*
))

(test '(equal '(13 17 19) (eval code)))

(print (funcall testobj 'result))

