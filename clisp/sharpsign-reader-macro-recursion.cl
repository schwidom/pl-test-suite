#!/usr/bin/clisp

(setf *print-circle* t)
(setf *print-case* :downcase) 

(require "testenv3.cl")

(defpackage current-test 
 (:import-from testenv3 test testobj)
)

(in-package current-test)


(funcall testobj :check-complain-and-adjust-expected 0)

(let ((rek '#1=(a #1#)))

 (test '(equal "#1=(a #1#)" (format nil "~s" rek)))
 (test '(equal "#1=(a #1#)" (format nil "~s" (cadr rek))))
 (test '(equal "#1=(a #1#)" (format nil "~s" (cadadr rek))))

 (test '(eq 'a (car rek)))
 (test '(eq 'a (caadr rek)))

)

(funcall testobj :check-complain-and-adjust-expected 5)

(let ((rek #1='(a #1#)))

; (setf rek #1=(list 'a #1#)) ; Program stack overflow. RESET

 (test '(consp rek))
 (test '(listp rek))
 
 (test '(equal "#1=(a '#1#)" (format nil "~s" rek)))
 (test '(equal "#1=('(a . #1#))" (format nil "~s" (cdr rek))))
 (test '(equal "#1='(a #1#)" (format nil "~s" (cadr rek))))
 (test '(eq 'quote (caadr rek)))
 ; (format t "~s~%" (cdadr rek)) ; Program stack overflow. RESET
 (test '(equal "#1=(a '#1#)" (format nil "~s" (cadadr rek))))
 
 
 (test '(eq rek (cadadr rek)))
 (test '(eq 'a (car rek)))
 
)
(funcall testobj :check-complain-and-adjust-expected 9)

(print (funcall testobj :result))
