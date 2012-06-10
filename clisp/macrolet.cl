#!/usr/bin/clisp

; file:///home/fschwidom/doc/lisp/www.lispworks.com/documentation/HyperSpec/Body/s_flet_.htm

; das macrolet erzeugt innerhalb von (macrolet ...) ein lokal gueltiges Macro

(load "testenv.cl")

(test '(not (functionp (symbol-function 'macrolet))))

(defun f (a) (macrolet ((m () 'a)) (m)))

(test '(eq 1 (f 1)))

(test '(eq 1 (macrolet ((m () 1)) (m))))

(test '(eq 1 (macrolet ((m (a) a)) (m 1))))

; siehe auch: flet, labels, symbol-macrolet

(print (funcall testobj 'result))
