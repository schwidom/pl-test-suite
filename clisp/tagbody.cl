#!/usr/bin/clisp

; file:///home/fschwidom/doc/lisp/www.lispworks.com/documentation/HyperSpec/Body/s_go.htm#go

(load "testenv.cl")

(test '(not (functionp (symbol-function 'tagbody))))
(test '(not (functionp (symbol-function 'go))))

(test '(not (functionp (macro-function 'tagbody))))
(test '(not (functionp (macro-function 'go))))

(test '(special-operator-p 'tagbody))
(test '(special-operator-p 'go))

;(test '(eq T (not NIL)))

(tagbody

 (setf val 1)
 (go mark)
 (incf val 1)
 (test 'NIL)
 mark 
 (test '(eq 1 val))
)

(tagbody mark (go mark) mark)

(test '(eq nil (tagbody 1)))

; sinngemaesses schema fuer tagbody als lambda, allerdings ohne das (block x (return-from )) feature - dann waere es noch einfacher, aber es muesste dann zusaetzlich (block ) in lambda ueberfheurt werden koennen
; ((lambda (&rest f) ((lambda (to-call) <to-call in f finden, rufen, bis liste zuende, es sei denn eine gerufene funktion liefert ein lambda zurueck (was einem in der funktion gerufenen go entspricht)>  ) (car f) ) ) (lambda () (if t (funcall f2) (progn (print 1)))) (lambda ()) (lambda ()))

(print (funcall testobj 'result))

