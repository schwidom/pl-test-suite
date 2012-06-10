#!/usr/bin/clisp

(require "testenv2.cl")

(defpackage current-test 
 (:import-from testenv2 test testobj result)
)

(setf *print-case* :downcase) ; darauf musste erstmal kommen

(in-package current-test)

(defmacro m (x) (format nil "~a" x))
(defmacro n (x) `(format nil "~a" ,x))
(defmacro o (x) (format nil "~s" x))
(defmacro p (x) `(format nil "~s" ,x))

(test '(equal "'a" (m 'a)))
(test '(equal "a" (n 'a)))
(test '(equal "'a" (o 'a)))
(test '(equal "a" (p 'a)))

(test '(equal "'t" (m 't)))
(test '(equal "t" (n 't)))
(test '(equal "'t" (o 't)))
(test '(equal "t" (p 't)))

(test '(equal "t" (m t)))
(test '(equal "t" (n t)))
(test '(equal "t" (o t)))
(test '(equal "t" (p t)))

(test '(equal "nil" (m nil)))
(test '(equal "nil" (n nil)))
(test '(equal "nil" (o nil)))
(test '(equal "nil" (p nil)))

(test '(equal "'(a)" (m '(a))))
(test '(equal "(a)" (n '(a))))
(test '(equal "'(a)" (o '(a))))
(test '(equal "(a)" (p '(a))))

(defmacro q (x) (format nil "~a" (symbol-name x)))

(let ((y 1))
 (test '(equal "y" (m y)))
 (test '(equal "1" (n y)))
 (test '(equal "y" (o y)))
 (test '(equal "1" (p y)))

 (test '(equal "Y" (q y)))
)

(defmacro r (x) `'( ,@ (loop for i in x collect i)))

(test '(equal '(1 2 3) (r (1 2 3))))

(let ((z '(1 2 3)))
 ;(test '(equal '(1 2 3) (r z))); geht nicht
 (test '(equal '(1 2 3) (eval `(r ,z)))); geht
)

(print (funcall testobj 'result))
