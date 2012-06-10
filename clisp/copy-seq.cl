#!/usr/bin/clisp

(setf *print-circle* t)
(setf *print-case* :downcase) 

(require "testenv3.cl")

(defpackage current-test 
 (:import-from testenv3 test testobj)
)

(in-package current-test)

(funcall testobj :check-complain-and-adjust-expected 0)

(let 
 (
  (seq1 '(a b c))
  seq2
 )

 (test '(equal '(a b c) seq1))
 (setf seq2 (copy-seq seq1))

 (test '(not (eq seq1 seq2)))

 (setf (cadr seq2) 'y)
 (test '(equal 'b (cadr seq1)))
 (test '(equal 'y (cadr seq2)))
 (test '(equal '(a b c) seq1))
 (test '(equal '(a y c) seq2))

)

(funcall testobj :check-complain-and-adjust-expected 6)

(let 
 (
  (seq1 '''a)
  seq2
 )

 (test '(equal '''a seq1))
 (test '(equal ''a (cadr seq1)))
 (test '(equal 'a (cadadr seq1)))

 (setf seq2 (copy-seq seq1))

 (test '(not (eq seq1 seq2)))

 (setf (cadadr seq2) 'b)
 (test '(equal 'b (cadadr seq1)))

 (test '(equal '''b seq1))
)

(funcall testobj :check-complain-and-adjust-expected 6)

(let 
 (
  (seq1 '''a)
  seq2
 )

 (test '(equal '''a seq1))
 (test '(equal ''a (cadr seq1)))
 (test '(equal 'a (cadadr seq1)))

 (setf seq2 (copy-tree seq1))

 (test '(not (eq seq1 seq2)))

 (setf (cadadr seq2) 'b)
 (test '(equal 'a (cadadr seq1)))

 (test '(equal '''a seq1))
 (test '(equal '''b seq2))
)

(funcall testobj :check-complain-and-adjust-expected 7)

(print (funcall testobj :result))
