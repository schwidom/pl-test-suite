#!/usr/bin/clisp

(setf *print-circle* t)
(setf *print-case* :downcase) 

(require "testenv3.cl")

(defpackage current-test 
 (:import-from testenv3 test testobj)
)

(in-package current-test)

(funcall testobj :check-complain-and-adjust-expected 0)

(test '(not (boundp 'lamb)))
(test '(not (fboundp 'lamb)))

(let ((lamb #'(lambda () 101)))
 (test '(not (compiled-function-p lamb)))
 (test '(eq 101 (funcall lamb)))

 (compile 'lamb lamb)

 (test '(fboundp 'lamb))
 (test '(not (compiled-function-p lamb)))
 (test '(not (compiled-function-p 'lamb)))
 (test '(compiled-function-p #'lamb))
 (test '(eq 101 (lamb)))
)

(test '(eq 101 (lamb)))

(fmakunbound 'lamb)
(test '(not (fboundp 'lamb)))


(funcall testobj :check-complain-and-adjust-expected 11)

; see also : lambda, boundp.cl, fboundp, makunbound.cl, fmakunbound

(print (funcall testobj :result))
