#!/usr/bin/clisp

(load "testenv.cl")

(test '(not (functionp (symbol-function 'defmethod))))
(test '(not (functionp (symbol-function 'defgeneric))))
(test '(functionp (macro-function 'defmethod)))
(test '(functionp (macro-function 'defgeneric)))

(setf class_c (defclass c () ()))
(setf class_d (defclass d () ()))

(defgeneric f1 (x))

(defmethod f1 ((x list)) 'list)
(defmethod f1 ((x cons)) 'cons)
(defmethod f1 ((x symbol)) 'symbol)
(defmethod f1 ((x string)) 'string)
;(defmethod f1 ((x keyword)) 'keyword)
;(defmethod f1 ((x bit)) 'bit)
(defmethod f1 ((x integer)) 'integer)

(defmethod f1 ((x c)) 'c)
(defmethod f1 ((x (eql (make-instance 'd)))) 'd)

(defmethod f1 ((x (eql 10))) 'zehn)

(test '(eq 'symbol (f1 NIL))) 
(test '(eq 'symbol (f1 'a))) 
(test '(eq 'cons (f1 '(1)))) 
(test '(eq 'cons (f1 (cons 1 2))))
(test '(eq 'cons (f1 (list 1 2 3))))

(test '(eq 'string (f1 "")))

(test '(eq 'integer (f1 1)))

'(test '(eq 'c (make-instance class_c)))
'(print (make-instance class_c))
'(print (make-instance 'c))

(test '(eq 'c (f1 (make-instance 'c))))
(test '(eq 'zehn (f1 10)))

; (test '(eq 'keyword (f1 :a))) ; zumindest liefert (type-of :a) keyword und (class-of :a) BUILT-IN-CLASS SYMBOL

; siehe auch call-next-method.cl

(print (funcall testobj 'result))
