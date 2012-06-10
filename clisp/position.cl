#!/usr/bin/clisp

(require "testenv2.cl")

(defpackage current-test 
 (:import-from testenv2 test testobj result)
 (:import-from ext substring)
)

(in-package current-test)

(test '(functionp (symbol-function 'position)))
(test '(functionp (symbol-function 'substring)))
(test '(not (functionp (symbol-function 'do))))
(test '(not (functionp (symbol-function 'do*))))

(setf seq "123*456*789")

(test '(eq 3 (position #\* seq)))

(test '(eq 7 (position #\* seq :start 4)))

(test '(eq NIL (position #\* seq :start 8)))

(test '(eq 1 (position 'b #(a b c))))

(test '(eq 1 (position 'b '(a b c))))

(test '(eq NIL (position "b" #("a" "b" "c"))))
(test '(eq 1 (position "b" #("a" "b" "c") :test #'equal)))
(test '(eq 1 (position "b" '("a" "b" "c") :test #'equal)))

(test '(equal "123" (substring seq 0 3)))
(test '(equal "456" (substring seq 4 7)))
(test '(equal "789" (substring seq 8)))

(setf l NIL)

(do*
 (
  (start 0 (+ end 1))
  (end (position #\* seq) (position #\* seq :start start))
 )

 ((eq NIL end) (pushnew (substring seq start) l))
 (pushnew (substring seq start end) l)
)

(test '(equal '("789" "456" "123") l))

(print (funcall testobj 'result))
