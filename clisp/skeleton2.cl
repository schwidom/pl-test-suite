#!/usr/bin/clisp

(setf *print-circle* t)
(setf *print-case* :downcase) 

(require "testenv2.cl")

(defpackage current-test 
 (:import-from testenv2 test testobj result)
)

(in-package current-test)

(test 't)

(print (funcall testobj 'result))
