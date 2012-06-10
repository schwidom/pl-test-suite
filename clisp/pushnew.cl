#!/usr/bin/clisp

(require "testenv2.cl")

(defpackage current-test 
 (:import-from testenv2 test testobj result)
)

(in-package current-test)

(test '(not (functionp (symbol-function 'pushnew))))

(let ((l NIL))
 (pushnew 1 l)
 (test '(equal '(1) l))
 (setf l1 l)
 (pushnew 1 l)
 (test '(equal '(1) l))
 (pushnew 2 l)
 (setf l21 l)
 (test '(equal '(2 1) l))
 (pushnew 2 l)
 (test '(equal '(2 1) l))
 (pushnew 1 l)
 (test '(equal '(2 1) l))
 (pushnew '(3) l)
 (test '(equal '((3) 2 1) l))

 (test '(equal '(2 1) l21))
 (test '(eq l21 (cdr l)))

 (test '(equal '(1) l1))
 (test '(eq l1 (cddr l)))
)


(print (funcall testobj 'result))
