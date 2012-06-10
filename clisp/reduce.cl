#!/usr/bin/clisp

(require "testenv2.cl")

(defpackage current-test 
 (:import-from testenv2 test testobj result)
)

(in-package current-test)

(defun rf1 (&optional x y) (list x y))

(test '(equal '(1 2) (reduce #'rf1 '(1 2))))
(test '(equal '((1 2) 3) (reduce #'rf1 '(1 2 3))))

(test '(eq 1 (reduce #'rf1 '(1))))
(test '(equal '(nil nil) (reduce #'rf1 '())))

(defun rf2 (&optional x y) (cons y x))
(test '(equal '(3 2 . 1) (reduce #'rf2 '(1 2 3))))
(test '(equal '(4 3 2 . 1) (reduce #'rf2 '(1 2 3 4))))

(print (funcall testobj 'result))
