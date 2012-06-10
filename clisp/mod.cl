#!/usr/bin/clisp

(setf *print-circle* t)
(setf *print-case* :downcase) 

(require "testenv3.cl")

(defpackage current-test 
 (:import-from testenv3 test testobj)
)

(in-package current-test)

(funcall testobj :check-complain-and-adjust-expected 0)


(test '(= 2 (mod 9 7)))

(loop for i from 16 downto -12 by 7 do
 (progn
  (test '(= 2 (mod i 7)))
  (test '(= -5 (mod i -7)))
  (test '(= 5 (mod (- i) 7)))
  (test '(= -2 (mod (- i) -7)))
 )
)

(funcall testobj :check-complain-and-adjust-expected 21)

(test '(= 2 (rem 9 7)))

(loop for i from 9 to 37 by 7 do
 (progn
  (test '(= 2 (rem i 7)))
  (test '(= 2 (rem i -7)))
  (test '(= -2 (rem (- i) 7)))
  (test '(= -2 (rem (- i)  -7)))
 )
)


(funcall testobj :check-complain-and-adjust-expected 21)

(print (funcall testobj :result))
