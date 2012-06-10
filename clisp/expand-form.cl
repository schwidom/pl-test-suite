#!/usr/bin/clisp 


(load "testenv.cl")

(test '(functionp (symbol-function 'expand-form)))
(test '(functionp (symbol-function 'macroexpand)))

(defmacro m (x) `(list ,x ,x ,x))
(defun f (x) (list x x x))

(test '(equal (expand-form '(m a)) '(list a a a)))
(test '(equal (macroexpand '(m a)) '(list a a a)))

(test '(equal (expand-form '(f (m a))) '(f (list a a a))))
(test '(equal (macroexpand '(f (m a))) '(f (m a))))

(defmacro m2 (x) `(list (m ,x) (m ,x)))

(test '(equal (expand-form '(m2 a)) '(list (list a a a) (list a a a))))
(test '(equal (macroexpand '(m2 a)) '(list (m a) (m a))))
(test '(equal (macroexpand (macroexpand '(m2 a))) '(list (m a) (m a))))

(print (funcall testobj 'result))

