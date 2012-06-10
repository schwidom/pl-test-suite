#!/usr/bin/clisp

(require "testenv2.cl")

(defpackage current-test 
 (:import-from testenv2 test testobj result)
)

(in-package current-test)

(defgeneric f1 (x)
 (:method ((x list)) 'list)
 (:method ((x cons)) 'cons)
 (:method ((s string)) 'string) ; aha, s geht auch
)

(test '(eq 'cons (f1 (cons 1 2))))
(test '(eq 'list (f1 ())))
(test '(eq 'string (f1 "")))

(test '(eq 'cons (f1 '(1)))) ; offensichtlich spielt die Reihenfolge keine Rolle

(defmethod f1 ((x (eql 10))) 'zehn); warnung ueber Modifikation, da bereits aufgerufen

(test '(eq 'zehn (f1 10)))

; siehe auch call-next-method.cl, defmethod.cl

(print (funcall testobj 'result))

