#!/usr/bin/clisp

(setf *print-circle* t)
(setf *print-case* :downcase) 

(require "testenv3.cl")

(defpackage current-test 
 (:import-from testenv3 test testobj)
)

(in-package current-test)

(funcall testobj :check-complain-and-adjust-expected 0)

(test '(functionp (symbol-function 'make-hash-table)))
(test '(functionp (symbol-function 'gethash)))
(test '(functionp (symbol-function 'equalp)))
(test '(functionp (symbol-function 'remhash)))

(funcall testobj :check-complain-and-adjust-expected 4)

(defvar *ht* (make-hash-table))
(defvar *ht2* (make-hash-table))

(defvar *ht3* (make-hash-table))
(defvar *ht4* (make-hash-table))

(test '(eq NIL (gethash 'a *ht*)))

(setf (gethash 'a *ht*) 'b)

(test '(eq 'b (gethash 'a *ht*)))

(test '(not (equalp *ht2* *ht*)))

(setf (gethash 'a *ht2*) 'b)

(test '(equalp *ht2* *ht*))

(setf (gethash 'c *ht*) *ht3*)

(test '(not (equalp *ht2* *ht*)))

(setf (gethash 'c *ht2*) *ht4*)

(test '(equalp *ht2* *ht*))

(setf (gethash 'd *ht3*) 'e)
(setf (gethash 'd *ht4*) 'f)

(test '(not (equalp *ht2* *ht*)))

(setf (gethash 'd *ht4*) 'e)

(test '(equalp *ht2* *ht*))

(remhash 'd *ht4*)

(test '(eq NIL (gethash 'd *ht4*)))

(test '(not (equalp *ht2* *ht*)))

(funcall testobj :check-complain-and-adjust-expected 10)

(let
 (
  (ht1 (make-hash-table))
  (ht2 (make-hash-table))
  (ht3 (make-hash-table :test #'equal))
  (ht4 (make-hash-table :test #'equal))
 )
 (test '(not (eq ht1 ht2)))
 (test '(not (eql ht1 ht2)))
 (test '(not (equal ht1 ht2)))
 (test '(equalp ht1 ht2))
 (test '(not (equalp ht1 ht3)))
 (test '(equalp ht4 ht3))
)
(funcall testobj :check-complain-and-adjust-expected 6)

(let ; default
 (
  (ht (make-hash-table))
 )

 (setf (gethash :a ht) 1)
  
 (test '(eq 1 (gethash :a ht :ox)))
 (test '(eq :ox (gethash :b ht :ox)))
)

(funcall testobj :check-complain-and-adjust-expected 2)

; siehe auch: maphash

(print (funcall testobj :result))

