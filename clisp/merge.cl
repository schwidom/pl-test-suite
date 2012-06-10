#!/usr/bin/clisp

(require "testenv2.cl")

(defpackage current-test 
 (:import-from testenv2 test testobj result)
)

(in-package current-test)

(test '(equal '(1 2 2 2 3) (merge 'list '(1 2 2 3) '(2) #'<)))

(test '(equal '(2 1 2 2 3 2) (merge 'list '(2 1 2 3 2) '(2) #'<)))

(print (funcall testobj 'result))

