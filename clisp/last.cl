#!/usr/bin/clisp

(setf *print-circle* t)
(setf *print-case* :downcase) 

(require "testenv3.cl")

(defpackage current-test 
 (:import-from testenv3 test testobj)
)

(in-package current-test)

(funcall testobj :check-complain-and-adjust-expected 0)

(let ((l '(1 2 3)))
 (test '(equal '(1 2 3) l))

 (test '(equal '(3) (last l)))
 (test '(equal '(1 2) (butlast l)))
 (test '(equal '(2 3) (last l 2)))
 (test '(equal '(1) (butlast l 2)))

 (test '(equal '(1 2 3) l))
 
 (test '(equal '(1) (nbutlast l 2)))

 (test '(equal '(1) l))

 (test '(equal '() (nbutlast l)))

 (test '(equal '(1) l))
)

(funcall testobj :check-complain-and-adjust-expected 10)

; see also last.cl, butlast.cl, nbutlast.cl

(print (funcall testobj :result))
