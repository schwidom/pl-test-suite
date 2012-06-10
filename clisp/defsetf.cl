#!/usr/bin/clisp

(require "testenv2.cl")

(defpackage current-test 
 (:import-from testenv2 test testobj result)
)

(in-package current-test)

(defun ass-y-z (y z) (assert (eq 1 y)) (assert (eq 2 z)))

(defun get-a (y z) (ass-y-z y z) a)
(defun set-a (y z x) (ass-y-z y z) (setf a x))

(defun (setf get-a) (x y z) (set-a y z x))

(setf (get-a 1 2) 111)

(test '(eq 111 (get-a 1 2)))
(test '(eq 111 a))

(defun get-b () b)
(defun set-b (x) (setf b x))

(defsetf get-b set-b)

(setf (get-b) 112)

(test '(eq 112 (get-b)))
(test '(eq 112 b))

(setf (funcall #'get-b) 113) ; alter schalter, das geht auch!

(test '(eq 113 (get-b)))
(test '(eq 113 b))

(print (funcall testobj 'result))

