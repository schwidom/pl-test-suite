#!/usr/bin/clisp

(require "testenv2.cl")

(defpackage current-test 
 (:import-from testenv2 test testobj result)
)

(in-package current-test)

(let 
 (
  (ht (make-hash-table))
  (ht2 (make-hash-table))
 )
 (setf (gethash 'a ht) 'b)
 (setf (gethash 'c ht) 'd)

 (test '(not (equalp ht ht2)))

 (let 
  ((res
   (maphash
    #'(lambda (k v)
     (setf (gethash k ht2) v)
    )
    ht
   )
  ))
  (test '(not res))
 )

 (test '(equalp ht ht2))
)


; see also make-hash-table.cl gethash.cl remhash.cl
; see also mapcan.cl, maphash.cl, mapcar

(print (funcall testobj 'result))
