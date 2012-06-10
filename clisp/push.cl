#!/usr/bin/clisp

(require "testenv2.cl")

(defpackage current-test 
 (:import-from testenv2 test testobj result)
)

(in-package current-test)

(test '(not (functionp (symbol-function 'pushnew))))

(let ((l NIL))
 (push 1 l)
 (test '(equal '(1) l))
 (setf l1 l)
 (push 1 l)
 (test '(equal '(1 1) l))
 (push 2 l)
 (setf l21 l)
 (test '(equal '(2 1 1) l))
 (push 2 l)
 (test '(equal '(2 2 1 1) l))
 (push 1 l)
 (test '(equal '(1 2 2 1 1) l))
 (push '(3) l)
 (test '(equal '((3) 1 2 2 1 1) l))

 (test '(equal '(2 1 1) l21))
 (test '(eq l21 (cdddr l)))

 (test '(equal '(1) l1))
 (test '(eq l1 (cdr (cddddr l))))
)

(print (funcall testobj 'result))
