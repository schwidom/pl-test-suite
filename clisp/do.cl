#!/usr/bin/clisp

(setf *print-circle* t)
(setf *print-case* :downcase) 

(require "testenv3.cl")

(defpackage current-test 
 (:import-from testenv3 test testobj)
)

(in-package current-test)

(funcall testobj :check-complain-and-adjust-expected 0)

(let ((result1 (list "root")) (result2 nil))

 (test '(eq 10
   (do ( (a 1 (+ 1 a))) ((= 10 a) (setf result2 a)) (nconc result1 (list a)))
 ))
 (test '(equal ''("root" 1 2 3 4 5 6 7 8 9) `', result1))
 (test '(equal ''10 `', result2))
) ; aus : /home/fschwidom/dev/mzscheme/erste_schritte/do.scm

(funcall testobj :check-complain-and-adjust-expected 3)

(let ((a 2) (sum 0))
 (test '(eq 'ret (do ((a a (+ a 1))) ((= 9 a) 'ret) (setf sum (+ sum a)))))
 (test '(eq 35 sum))
)

(funcall testobj :check-complain-and-adjust-expected 2)

(print (funcall testobj :result))

