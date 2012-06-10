#!/usr/bin/clisp

(require "testenv2.cl")

(defpackage current-test 
 (:import-from testenv2 test testobj result)
)

(in-package current-test)

(test '(not (functionp (symbol-function 'cond))))
(test '(functionp (macro-function 'cond)))

(test '(eq 4 (cond (T 1 4) (NIL 2 5) (T 3 6))))
(test '(eq 5 (cond (NIL 1 4) (T 2 5) (T 3 6))))

(test '(eq T (cond (T))))

(let ((cnt1 0)(cnt2 0))
 (test '(eq 5 (cond (NIL (incf cnt1))(T (progn (incf cnt2) 2) (progn 5)) (T (incf cnt1)))))
 (test '(eq 0 cnt1))
 (test '(eq 1 cnt2))
)

(test '(eq NIL (cond (NIL (progn 2) (progn 1)))))

(print (funcall testobj 'result))

