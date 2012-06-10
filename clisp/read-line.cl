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
  (eof-value (gensym))
  (testlist '("a" "bbbbbbbb" "c"))
 )
 (with-open-file (f "testdata-file-to-read-line.txt" :direction :input )
  (let (rod-line)
   (loop
    do
    (progn 
     (setf rod-line (read-line f nil eof-value))
     (when (eq eof-value rod-line) (return))
     ;(print rod-line)
     (test '(equal (pop testlist) rod-line))
    )
   )
  )
 )
)

(funcall testobj :check-complain-and-adjust-expected 3)

(print (funcall testobj :result))
