#!/usr/bin/clisp

(require "testenv2.cl")

(defpackage current-test 
 (:import-from testenv2 test testobj result)
)

(in-package current-test)

; die liste wird bei Randomzugriffen mit der Zeit ineffizient, die finden aber aktuell nicht statt

; die funktionen fib und fac sind umstaendlich programmiert - das koennte ueber metaprogrammierung - vorzugsweise ueber macros - einfacher gehen

; allerdings liegt der vorteil bei der listenerzeugung gerade bei der fibonacci-liste darin, dass der berechnungsaufwand nicht ins exponentiell unermessliche steigt, wie bei (defun fib (n) (if (find n '(0 1)) 1 (+ (fib (- n 1)) (fib (- n 2)))))

; aussergewoehnlich ist auch, dass der rekursionsbeginn ueber den listeninhalt definiert wird und nicht in der funktion selber, da ist lediglich das blanke rekursions-schema hinterlegt

; also ist die vorgehensweise insgesamt nicht danz uninteressant fuer ki zwecke - die result_list sollte aber bei Randomzugriffen eher in eine hashtable verwandelt werden - oder das ganze besser kapseln und per switch die Art der Behandlung festlegen, da auch das loeschen der daten sinvoll sein kann und irgendwie gehandhabt werden koennen muss (loeschen aelterer unbenutzter daten zb)

(setf result_list NIL)


(defun fib (x) 
 (if (assoc `(fib ,x) result_list :test #'equal)
  (cadr (assoc `(fib ,x) result_list :test #'equal))
  (let (res (x-1 (- x 1)) (x-2 (- x 2)))
   (let 
    (
     (fib-x-1 (cadr (assoc `(fib ,x-1) result_list :test #'equal)))
     (fib-x-2 (cadr (assoc `(fib ,x-2) result_list :test #'equal)))
    )
    (when (not fib-x-1) (error "fib-x-1 not defined x-1: ~s" x-1))
    (when (not fib-x-2) (error "fib-x-2 not defined x-2: ~s" x-2))
    (let ((res (+ fib-x-1 fib-x-2)))
     (pushnew `((fib ,x) ,res) result_list)
     res
    )
   )
  )
 )
)

(pushnew '((fib 0) 1) result_list)
(pushnew '((fib 1) 1) result_list)


(test '(eq 2 (fib 2)))

(test '(equal '((fib 2) 2) (assoc `(fib ,2) result_list :test #'equal)))

(defun fac (x) 
 (if (assoc `(fac ,x) result_list :test #'equal)
  (cadr (assoc `(fac ,x) result_list :test #'equal))
  (let (res (x-1 (- x 1)))
   (let 
    (
     (fac-x-1 (cadr (assoc `(fac ,x-1) result_list :test #'equal)))
    )
    (when (not fac-x-1) (error "fac-x-1 not defined x-1: ~s" x-1))
    (let ((res (* x fac-x-1)))
     (pushnew `((fac ,x) ,res) result_list)
     res
    )
   )
  )
 )
)



(pushnew '((fac 0) 1) result_list)

(test '(eq 1 (fac 1)))
(test '(eq 2 (fac 2)))
(test '(eq 6 (fac 3)))
(test '(eq 24 (fac 4)))

(labels 
 (
  (ll (fun)
   (labels 
    (
     (f (&optional (x 0))
      (cons (cons x (funcall fun x)) (lambda () (f (+ x 1))))
     )
    )
    (f)
   )
  )
 )

 (let ((res (ll #'fac)))
  (loop
   do
   (progn
    (print (car res))
    (when (eq 10 (caar res)) (return))
    (setf res (funcall (cdr res)))
   )
  )
 )

 (let ((res (ll #'fib)))
  (loop
   do
   (progn
    (print (car res))
    (when (eq 10 (caar res)) (return))
    (setf res (funcall (cdr res)))
   )
  )
 )
)

(print (funcall testobj 'result))

