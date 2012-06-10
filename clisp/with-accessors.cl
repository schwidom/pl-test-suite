#!/usr/bin/clisp

(require "testenv2.cl")

(defpackage current-test 
 (:import-from testenv2 test testobj result)
)

(in-package current-test)

(test '(not (functionp (symbol-function 'with-accessors))))

(defclass c () ((x :initarg :x :accessor ax) (y :initarg :y :accessor ay)))

(setf o1 (make-instance 'c :x 1 :y 2))
(setf o2 (make-instance 'c :x 3 :y 4))

(test '(eq 1 (ax o1)))
(test '(eq 2 (ay o1)))
(test '(eq 3 (ax o2)))
(test '(eq 4 (ay o2)))

(with-accessors ((x ax) (y ay)) o1
 (test '(eq 1 x))
 (test '(eq 2 y))
)

(with-accessors ((x ax) (y ay)) o2
 (test '(eq 3 x))
 (test '(eq 4 y))
)

(with-accessors ((x ax) (y ay)) o2
 (setf x 5)
 (setf y 6)
)

(test '(eq 5 (ax o2)))
(test '(eq 6 (ay o2)))

(print (funcall testobj 'result))

