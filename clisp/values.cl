#!/usr/bin/clisp

(require "testenv2.cl")

(defpackage current-test 
 (:import-from testenv2 test testobj result)
 (:import-from ext letf)
)


(in-package current-test)

(test '(functionp (symbol-function 'values)))

(setf (values a b) (values 1))

(test '(equal 1 a))

(setf (values a b) (values 1 2 3))

(test '(equal '(1 2) (list a b) ))

(setf (values a b) (values-list '(5 6 7)))

(test '(equal '(5 6) (list a b) ))

(test '(eq (values 1 2) (values 1 3)))
(test '(eq 1 (values 1 4)))

(test '(not (eq (values 2 1) (values 3 1))))

(test '(equal '(1 2) (list 1 (values 2 3))))

(letf (((values a b) (values 1 2)))
 (test '(eq a 1))
 (test '(eq b 2))
)

; siehe auch setf.cl

(print (funcall testobj 'result))

