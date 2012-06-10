#!/usr/bin/clisp

(setf *print-circle* t)
(setf *print-case* :downcase) 

(require "testenv2.cl")

(defpackage current-test 
 (:import-from testenv2 test testobj result)
)

(in-package current-test)

(let (x (y 2))
 (test '(eq nil x))
 (test '(not (boundp 'x)))
 (test '(not (boundp 'y)))
 (setf x nil)
 (test '(not (boundp 'x)))
 (setf x 0)
 (test '(not (boundp 'x)))
 (setf x 1)
 (test '(not (boundp 'x)))
 (makunbound 'x)
 (test '(not (boundp 'x)))
)

(test '(not (boundp 'x)))
(setf x nil)
(test '(boundp 'x))
(makunbound 'x)
(test '(not (boundp 'x)))

(print (funcall testobj 'result))
