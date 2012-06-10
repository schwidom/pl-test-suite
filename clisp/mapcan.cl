#!/usr/bin/clisp

(setf *print-circle* t)
(setf *print-case* :downcase) 

(require "testenv3.cl")

(defpackage current-test 
 (:import-from testenv3 test testobj)
)

(in-package current-test)

(funcall testobj :check-complain-and-adjust-expected 0)

(test '(equal '(2 :z 4 :z 6 :z) 
  (mapcan #'(lambda (x) (and (evenp x) (list x :z))) '(1 2 3 4 5 6))))

(funcall testobj :check-complain-and-adjust-expected 1)

; see also mapcan.cl, maphash.cl, mapcar

(print (funcall testobj :result))
