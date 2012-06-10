#!/usr/bin/clisp

(setf *print-circle* t)
(setf *print-case* :downcase) 

(require "testenv2.cl")

(defpackage current-test 
 (:import-from testenv2 test testobj result)
)

(in-package current-test)

(test '(equal '(2 1) (set-difference '(9 2 3 4 1 8) '(3 4 5 6 7 8 9))))
(test '(equal '(1 2) (set-difference '(9 1 3 4 2 8) '(3 4 5 6 7 8 9))))

; falls obiges mal nicht klappt:
(test '(equal '(1 2) (sort (set-difference '(9 1 3 4 2 8) '(3 4 5 6 7 8 9)) #'<)))

(test '(equal '(7 6 5) (set-difference '(3 4 7 6 5 8 9) '(9 1 3 4 2 8))))
(test '(equal '(5 6 7) (set-difference '(3 4 5 6 7 8 9) '(9 1 3 4 2 8))))

; falls obiges mal nicht klappt:
(test '(equal '(5 6 7) (sort (set-difference '(3 4 5 6 7 8 9) '(9 1 3 4 2 8)) #'<)))

; siehe auch: intersection, union

(print (funcall testobj 'result))
