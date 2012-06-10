#!/usr/bin/clisp

(setf *print-circle* t)
(setf *print-case* :downcase) 

(require "testenv2.cl")

(defpackage current-test 
 (:import-from testenv2 test testobj result)
)

(in-package current-test)

(test '(equal 
 '(#1="root" #2="a" #3="b" #2# #3# #2# #3# #2# #1# #2# #3# #2# #3# #2# #3# #2# #1#)
 '("root" "a" "b" "a" "b" "a" "b" "a" "root" "a" "b" "a" "b" "a" "b" "a" "root")

))

(test '(equal 
 '(#5="root" #1="a" #3="b" #1# #3# #1# #3# #1# #5# #1# #3# #1# #3# #1# #3# #1# #5#)
 '("root" "a" "b" "a" "b" "a" "b" "a" "root" "a" "b" "a" "b" "a" "b" "a" "root")

))

(print (funcall testobj 'result))
