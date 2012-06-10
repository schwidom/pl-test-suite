#!/usr/bin/clisp

(require "testenv3.cl")

(defpackage current-test 
 (:import-from testenv3 test testobj)
)

(in-package current-test)

(funcall testobj :check-complain-and-adjust-expected 0)

(test '(equal '(1 2) (assoc 1 '((1 2)(3 4)))))
(test '(equal '(3 4) (assoc 3 '((1 2)(3 4)(3 5)))))
(test '(equal NIL (assoc 5 '((1 2)(3 4)))))

(test '(equal '((3 4)) (assoc 4 '(((1 2))((3 4))((3 5))) :key #'cadr)))

(funcall testobj :check-complain-and-adjust-expected 4)

(print (funcall testobj :result))
