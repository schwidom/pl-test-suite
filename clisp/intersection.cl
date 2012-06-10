#!/usr/bin/clisp

; file:///home/fschwidom/doc/lisp/www.lispworks.com/documentation/HyperSpec/Body/f_isec_.htm

(load "testenv.cl")

(test '(functionp (symbol-function 'intersection)))

;(test '(eq T (not NIL)))

(test '(equal NIL (intersection '(1) '(2))))

(test '(equal '(2 3) (intersection '(1 2 3) '(2 3 4))))

(test '(equal '(2 3) (intersection '(2 1 3) '(2 3 4))))

(test '(equal '(2 2 3) (intersection '(2 2 3) '(2 3 4))))

(test '(equal '(2 2 3 3) (intersection '(2 2 3 3) '(2 3 4))))

(test '(equal '(2 3) (intersection '(2 3 4) '(2 2 3 3) )))

(test '(equal '(2 3) (intersection '(1 2 3) '(2 3 4) :key NIL)))


;(test '(eq T (f 1 2)))

;(print (intersection '(1 2 3) '(2 3 4) :key 'f))

(test '(eq NIL (intersection '("A") '("A") :test 'eq)))
(test '(equal '("A") (intersection '("A") '("A") :test 'equal)))

(setf fTrace '(root)) ; geht mit leerer Liste nicht, da ('() == NIL) != cons
(defun f ( a b ) (let ((ret (eq (+ a 3) b))) (nconc fTrace (list (list a b ret))) ret))

(test '(equal '(1) (intersection '(1 2 3) '(4 3 2) :test 'f)))

(test '(equal '(ROOT (1 4 T) (2 4 NIL) (2 3 NIL) (2 2 NIL) (3 4 NIL) (3 3 NIL) (3 2 NIL)) fTrace))

; siehe auch: set-difference, union

(print (funcall testobj 'result))

