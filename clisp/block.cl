#!/usr/bin/clisp

(require "testenv2.cl")

(defpackage current-test 
 (:import-from testenv2 test testobj result)
)

(in-package current-test)

(test '(not (functionp (symbol-function 'block))))
(test '(not (functionp (macro-function 'block))))
(test '(special-operator-p 'block))

(test '(not (functionp (symbol-function 'return-from))))
(test '(not (functionp (macro-function 'return-from))))

(test '(special-operator-p 'return-from))

(test '(not (functionp (symbol-function 'return))))
(test '(functionp (macro-function 'return)))

(test '(eq NIL (block ret)))

(test '(eq 1 (block ret 1)))

(test '(eq 1 (block ret (progn 1))))

(test '(eq 2 (block ret (return-from ret 2))))
(test '(eq 2 (block :ret (return-from :ret 2))))

(test '(eq 3
 (block ret
  (flet ((returns () (return-from ret 3)))
   (returns)
  )
 )
))

(test '(eq 1 (block NIL (return 1) 2)))
(test '(eq NIL (block NIL (return) 2)))

(test '(eq 1 (block NIL (block a (return 1)) 2)))
(test '(eq 2 (block a (block NIL (return 1)) 2)))

(test '(eq 3 (block NIL (block NIL (return 1) 2) 3)))
(test '(eq 1 (block NIL (block NIL (return 1) 2))))

(print (funcall testobj 'result))
