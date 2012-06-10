#!/usr/bin/clisp

(require "testenv3.cl")

(defpackage current-test 
 (:import-from testenv3 test testobj)
)

(in-package current-test)

(funcall testobj :check-complain-and-adjust-expected 0)

(let (a)
 (symbol-macrolet ((x a))
  (setf x 1)
 )

 (test '(eq 1 a))
)

(test '(handler-case
(let (a)
 (symbol-macrolet ((x setf))
  (x a 1)
 )

 (test 'nil)
)
(error (x) t)
))

(funcall testobj :check-complain-and-adjust-expected 2)

; siehe auch: macrolet, flet, labels

(print (funcall testobj :result))
