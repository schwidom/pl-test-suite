#!/usr/bin/clisp

(setf *print-circle* t)
(setf *print-case* :downcase) 

(require "testenv3.cl")

(defpackage current-test 
 (:import-from testenv3 test testobj)
)

(in-package current-test)

(funcall testobj :check-complain-and-adjust-expected 0)


(test '(eq 'nil nil)) ; nil expands to 'nil

(test '(eq '1 1)) ; 1 expands to '1

(setf one 1) ; one gets 1 expandet => '1

(test '(eq '1 one)) ; one expands to '1

(funcall testobj :check-complain-and-adjust-expected 3)

(macrolet 
 (
  (m (e)
   (test `(equal '(incf a) e)) ; macro parameters hold the exactly given value, not expanded
   e
  )
 )
 (test '(eq 1 (let ((a 0)) (incf a) a)))
 (test '(eq 1 (let ((a 0)) (m (incf a)) a)))
)

(funcall testobj :check-complain-and-adjust-expected 3)

; see also eval, macro, macrolet, list, quote

(print (funcall testobj :result))
