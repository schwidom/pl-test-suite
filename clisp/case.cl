#!/usr/bin/clisp

(require "testenv2.cl")

(defpackage current-test 
 (:import-from testenv2 test testobj result)
)

(in-package current-test)

(defun f (x)
 (case x
  ('a 'a)
  ((1 2) '12)
  (('b 'c) 'bc)
  (nil 'nilvalue)
  ((nil) 'nilslot)
  ('d 'e)
  (:f 'f)
  ((:h :g) 'gh)
  ("a" "a")
  ('(1 2) '(1 2))
  ((+ 1 2) 3)
  (otherwise 'otherwise)
 )
)

(test '(eq 'a (f 'a)))
(test '(eq '12 (f '1)))
(test '(eq 'otherwise (f 'c)))
(test '(eq 'nilslot (f NIL)))
(test '(eq 'otherwise (f 'z)))
(test '(eq 'e (f 'd)))
(test '(eq 'f (f :f)))
(test '(eq 'gh (f :g)))
(test '(not (equal "a" (f "a"))))
(test '(eq 'otherwise (f "a")))
(test '(not (equal '(1 2) (f '(1 2)))))
(test '(eq 'otherwise (f '(1 2))))
(test '(eq 3 (f '+)))

(print (funcall testobj 'result))
