#!/usr/bin/clisp

(setf *print-circle* t)
(setf *print-case* :downcase) 

(require "testenv3.cl")

(defpackage current-test 
 (:import-from testenv3 test testobj)
)

(in-package current-test)

(funcall testobj :check-complain-and-adjust-expected 0)

(defun f () '(1))

(test '(equal '(1) (f)))

(let ((f #'f)) (defun f () `( 2 . ,(funcall f))))

(test '(equal '(2 1) (f)))

(let ((f #'f)) (defun f () `( 3 . ,(funcall f))))

(test '(equal '(3 2 1) (f)))

(funcall testobj :check-complain-and-adjust-expected 1)

(print (funcall testobj :result))
