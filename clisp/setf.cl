#!/usr/bin/clisp

(load "testenv.cl")

(test '(not (functionp (symbol-function 'setf))))
(test '(not (functionp (symbol-function 'letf))))
(test '(functionp (macro-function 'setf)))
(test '(functionp (macro-function 'letf))) ; wie setf nur local, package ext

(let ((a 2)) (setf a 3)
 (test '(eq 3 a))
)

(test '(not (boundp 'a)))

(setf a 4)

(test '(boundp 'a))
(test '(eq 4 a))

(let ((a 1)) (setf a 5)
 (test '(eq 5 a))
)

(test '(eq 4 a))

(let ((b 1)) 
 (setf a 5)
)

(defmacro newcadr (l) `(cadr ,l))

(let ((l '(1 2)))
 (setf (cadr l) 3)
 (test '(equal '(1 3) l))
 (setf (newcadr l) 4)
 (test '(equal '(1 4) l))
 (setf (car (cdr l)) 5)
 (test '(equal '(1 5) l)) ; ganz klar, denn letzlich braucht setf nur auf car funktionieren, cdr liefert ja eine liste in der ja die aenderung geschieht
)


(test '(eq 5 a))

; siehe auch values.cl, letf.cl, defun_setf.cl, defsetf.cl

(print (funcall testobj 'result))


