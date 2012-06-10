#!/usr/bin/clisp

(setf *print-circle* t)
(setf *print-case* :downcase) 

(require "testenv2.cl")

(defpackage current-test 
 (:import-from testenv2 test testobj result)
)

(in-package current-test)

(destructuring-bind ((a) (b) (c))
 '((1) (2) (3))

 (test '(eq 1 a))
 (test '(eq 2 b))
 (test '(eq 3 c))
)

(test '(not (boundp 'a)))
(test '(not (boundp 'b)))
(test '(not (boundp 'c)))

(destructuring-bind (a b c)
 '(1 2 3)

 (test '(eq 1 a))
 (test '(eq 2 b))
 (test '(eq 3 c))
)

(destructuring-bind ((a &optional b) (c))
 '((1 2) (3))

 (test '(eq 1 a))
 (test '(eq 2 b))
 (test '(eq 3 c))
)

(destructuring-bind ((a &optional (b 4)) (c))
 '((1) (3))

 (test '(eq 1 a))
 (test '(eq 4 b))
 (test '(eq 3 c))
)

(destructuring-bind (a &optional b &rest c)
 '(1 2 3 4)

 (test '(eq 1 a))
 (test '(eq 2 b))
 (test '(equal '(3 4) c))
)

(print (funcall testobj 'result))

