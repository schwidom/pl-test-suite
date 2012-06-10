#!/usr/bin/clisp

(load "testenv.cl")

(test '(not (functionp (symbol-function 'defclass))))
(test '(functionp (macro-function 'defclass)))
(test '(functionp (macro-function 'defclass)))
(test '(functionp (symbol-function 'class-name)))
(test '(functionp (symbol-function 'make-instance)))
(test '(functionp (symbol-function 'slot-exists-p)))
(test '(functionp (symbol-function 'slot-boundp)))
(test '(functionp (symbol-function 'class-of)))
(test '(functionp (symbol-function 'find-class)))
(test '(functionp (symbol-function 'slot-value)))
(test '(functionp (symbol-function 'class-slots)))
(test '(functionp (symbol-function 'slot-definition-name)))

(setf class_c (defclass c ()(x)))

(test '(eq 'c (class-name class_c)))
(test '(eq class_c (find-class 'c)))

(test '(equal '(x) (mapcar #'slot-definition-name (class-slots class_c))))

(setf class_d (defclass d ()((x))))
(test '(equal '(x) (mapcar #'slot-definition-name (class-slots class_d))))

(setf class_e (defclass d ()(x y)))
(test '(equal '(x y) (mapcar #'slot-definition-name (class-slots class_e))))

(setf class_f (defclass d ()((x) (y))))
(test '(equal '(x y) (mapcar #'slot-definition-name (class-slots class_f))))

(test '(eq 'STANDARD-CLASS (type-of class_c)))

;(test '(eq '#<STANDARD-CLASS STANDARD-CLASS> (class-of class_c)))

(test '(eq 'STANDARD-CLASS (class-name (class-of class_c))))

(test '(eq 'STANDARD-CLASS (clos::class-classname (class-of class_c))))

;(setf object_of_c (make-instance 'c))
(setf object_of_c (make-instance class_c)) ; beides geht, ersteres ist wohl wahrscheinlicher

(test '(slot-exists-p object_of_c 'x))
(test '(not (slot-exists-p object_of_c 'y)))

(test '(not (slot-boundp object_of_c 'x)))

(setf (slot-value object_of_c 'x) 1)

(test '(slot-boundp object_of_c 'x))

(test '(eq 1 (slot-value object_of_c 'x)))

;siehe auch with-accessors.cl, with-slots.cl

(print (funcall testobj 'result))

