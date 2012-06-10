#!/usr/bin/clisp

; (inspect 'a) # schaltet in debug-modus
; NIL ist false

(require "testenv2.cl")

(defpackage current-test 
 (:import-from testenv2 test testobj result)
)

(in-package current-test)

;(test NIL) ; false-Test

(test '(eq T (not NIL)))
(test '(eq NIL (not T)))
(test '(not( eq NIL (not NIL))))
(test '(not( eq T (not T))))
(test '(eq T T))
(test '(eq NIL NIL))

(test '(eq ':a :a))
(test '(not (eq :a :|a|)))
(test '(not (eq ':a :|a|)))
(test '(not (eq ':a ':|a|)))

(test '(eq :1 :|1|))
(test '(eq ':1 :|1|))
(test '(eq ':1 ':|1|))

(let ((a 1))
 (test '(eq 1 a))
)

(test '(equal '(1 2 3) '(1 2 3)))
(test '(not (equal '(1 2 3) '(1 5 3))))
(test '(not (eq '(1 2 3) '(1 2 3))))

(defun myclass ()
 (let ((a 0))
  (let 
   (
    (myobj
     (lambda
      (instruction)
      (case instruction
       ('get a)
       ('set (lambda (x) (setf a x)))
      )
     )
    )
   )
   myobj
  )
 )
)


(let ( (myobj (myclass)) )
 (test '(eq 0 (funcall myobj 'get)))
 (test '(eq 8 (funcall (funcall myobj 'set) 8)))
 (test '(eq 8 (funcall myobj 'get)))
 (test '(eq 7 (funcall (funcall myobj 'set) 7)))
 (test '(eq 7 (funcall myobj 'get)))
)

; (print a) ; nicht definiert

(let ( (myobj (lambda (x) x)) )
 (test '(eq 9 (funcall myobj 9)))
)

; (throw 'c 1) ; THROW: Es gibt kein CATCH zur Marke C

(test '(equal '(A . B) (cons 'A 'B)))

(test '(eq 3 (getf '(:a 1 :b 2 :c 3) :c)))

(defun ftrue () 't)

(test '(funcall (symbol-function 'ftrue)))

(test '(eq 2 (progn 1 2)))
(test '(eq 2 (progn (test 'T) (progn (test 'T)) 2)))

(flet ((f (x &key y) (test '(equal '(:y :y) (list y y)))))
 (f :y :y :y)
)

(test '(if 0 T))

; siehe auch read_eval.cl, read_expand-form_eval.cl

(print (funcall testobj 'result))
