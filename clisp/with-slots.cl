#!/usr/bin/clisp

(require "testenv2.cl")

(defpackage current-test 
 (:import-from testenv2 test testobj result)
)

(in-package current-test)

(test '(not (functionp (symbol-function 'with-slots))))

(defclass c () ((x :initarg :x) (y :initarg :y)))

(setf o1 (make-instance 'c :x 1 :y 2))
(setf o2 (make-instance 'c :x 3 :y 4))

(test '(eq 1 (slot-value o1 'x)))
(test '(eq 2 (slot-value o1 'y)))
(test '(eq 3 (slot-value o2 'x)))
(test '(eq 4 (slot-value o2 'y)))

(with-slots (x y) o1
 (test '(eq 1 x))
 (test '(eq 2 y))
)

(with-slots (x y) o2
 (test '(eq 3 x))
 (test '(eq 4 y))
)

(with-slots (x y) o2
 (setf x 5)
 (setf y 6)
)

(test '(eq 5 (slot-value o2 'x)))
(test '(eq 6 (slot-value o2 'y)))

#|(with-slots (x y) o2
 (eval '(progn
 (test '(eq 5 x))
 (test '(eq 6 y))
 ))
)|# ;die variable x hat keinen wert

(eval 
'(with-slots (x y) o2
 
 (test '(eq 5 x))
 (test '(eq 6 y))
)
)

(print (funcall testobj 'result))

