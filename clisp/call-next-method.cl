#!/usr/bin/clisp

(load "testenv.cl")

;(test '(not (functionp (symbol-function 'call-next-method)))) ; nicht definiert
(test '(functionp (symbol-function 'no-next-method)))
(test '(not (functionp (symbol-function 'defgeneric))))
(test '(functionp (macro-function 'defgeneric)))

(setf class_c (defclass c () ()))
(setf class_d (defclass d () ()))

(defgeneric f1 (x))

(defmethod f1 (x) '(before-no-next-method))
(defmethod f1 ((x list)) (cons 'list (call-next-method)))
(defmethod f1 ((x number)) (cons 'number (call-next-method)))
(defmethod f1 ((x cons)) (cons 'cons (call-next-method)))
(defmethod f1 ((x symbol)) (cons 'symbol (call-next-method)))
(defmethod f1 ((x vector)) (cons 'vector (call-next-method)))
(defmethod f1 ((x string)) (cons 'string (call-next-method)))
;(defmethod f1 ((x keyword)) 'keyword)
;(defmethod f1 ((x bit)) 'bit)
(defmethod f1 ((x integer)) (cons 'integer (call-next-method)))

(defmethod f1 ((x c)) (cons 'c (call-next-method)))

(defmethod f1 ((x (eql 10))) (cons 'zehn (call-next-method)))

;(defmethod f1 ((x keyword)) (cons 'keyword (call-next-method)))

(test '(equal '(zehn integer number before-no-next-method) (f1 10)))
(test '(equal '(cons list before-no-next-method) (f1 '(1 2 3))))
(test '(equal '(cons list before-no-next-method) (f1 '(1 . 2))))
(test '(equal '(cons list before-no-next-method) (f1 (cons 1 2))))
(test '(equal '(symbol list before-no-next-method) (f1 nil)))
(test '(equal '(string vector before-no-next-method) (f1 "")))
(test '(equal '(vector before-no-next-method) (f1 #())))
(test '(equal '(c before-no-next-method) (f1 (make-instance 'c))))
(test '(equal '(symbol before-no-next-method) (f1 :a)))
(test '(equal '(symbol before-no-next-method) (f1 'a)))

(defgeneric f2 (x y))

(defmethod f2 (x y) '(before-no-next-method))
(defmethod f2 ((x list) (y list)) (cons 'list_list (call-next-method)))
(defmethod f2 ((x cons) (y cons)) (cons 'cons_cons (call-next-method)))
(defmethod f2 ((x list) (y cons)) (cons 'list_cons (call-next-method)))
(defmethod f2 ((x cons) (y list)) (cons 'cons_list (call-next-method)))

(test '(equal '(cons_cons cons_list list_cons list_list before-no-next-method) (f2 '(1 2 3) '(1 2 3))))

; siehe auch defmethod.cl

(print (funcall testobj 'result))
