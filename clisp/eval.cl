#!/usr/bin/clisp

(require "testenv2.cl")

; eigenes eval:
; (defmacro ev2 (x) (cadr x)) 
; (cdr ''T) => (T)
; (cadr ''T) => T
; (equal (list 'quote T) ''T) ; aha!
; expandiert zum uebergebenen ausdruck (wenn als '() uebergeben) und fuehrt ihn (nach der expansion) im 

(defpackage current-test 
 (:import-from testenv2 test testobj result)
)

(in-package current-test)

(defmacro myeval1 (x)
 `(eval ,x)
)

(defmacro myeval2 (x)
 (eval x)
)

(defmacro mycar1 (x)
 `(car ,x)
)

(defmacro mycar2 (x)
 (car x)
)

(defmacro myeval3 (x)
 `(let ()
  ,(eval x)
 )
)

(defmacro myeval4 (x)
 ``(let ()
  ,,(eval x)
 )
)

(defmacro myeval5 (x)
 ``(let ()
  ,(eval ,x)
 )
)

(defmacro myeval6 (x) (if (listp x) `(list 'quote ,(eval `(cdr ,x))) (+ x x)))

(defmacro myeval7 (x) (if (listp x) (print "list")))
(defmacro myeval8 (x) (list 'quote (car x)))
(defmacro myeval9 (x) (if (listp (eval x)) "list" "nolist"))
(defmacro myevalA (x) (if (eval x) T))
(defmacro myevalB (x) (progn (progn (progn (eval (eval x)) T))))
(defmacro myevalC (x) (progn (progn (progn (eval x)) T)))

(defmacro myevalE (x) `(if ,(listp (eval x)) "list" "nolist"))
(defmacro myevalF (x) `(if (listp ,(eval x)) "list" "nolist"))
(defmacro myevalG (x) `(if (listp ,x) "list" "nolist"))

(let ((i 1)(s 'a)(l '(1 2 3)))
 ;(eval '(eq 1 l)) ; so nicht
 (eval `(equal '1 ,i))
 ;(eval `(equal 'a ,s)) ; so nicht
 ;(eval `(equal '(1 2 3) ,l)) ; so nicht
 (myeval2 '(equal 'a s))
 (myeval2 '(equal '(1 2 3) l))
 (myeval2 '(equal 1 (mycar1 l)))
 ;(myeval2 '(equal 1 (mycar2 l))) ; so nicht

 (myeval3 '(equal '(1 2 3) l))
 (myeval4 '(equal '(1 2 3) l))
 ;(myeval5 '(equal '(1 2 3) l)) ; variable l hat keinen wert

 (myeval6 '(x eq 1 1))
 (myeval6 3)

 (myeval7 '(x eq 1 1))
 (myeval7 'T); list?
 (myeval7 T)
 (myeval7 3)

 ;(print (myeval8 'T))

 (print "---")

 (test '(equal "list" (myeval9 '(x eq 1 1))))
 (test '(equal "nolist" (myeval9 'T)))
 (test '(equal "nolist" (myeval9 T)))
 (test '(equal "nolist" (myeval9 3)))

 (test '(equal "list" (myevalE '(x eq 1 1))))
 (test '(equal "nolist" (myevalE 'T)))
 (test '(equal "nolist" (myevalE T)))
 (test '(equal "nolist" (myevalE 3)))

 ;(test '(equal "list" (myevalF '(x eq 1 1)))) ; funktion x nicht definiert
 (test '(equal "nolist" (myevalF 'T)))
 (test '(equal "nolist" (myevalF T)))
 (test '(equal "nolist" (myevalF 3)))

 (test '(equal "list" (myevalG '(x eq 1 1)))) ; funktion x nicht definiert
 (test '(equal "nolist" (myevalG 'T)))
 (test '(equal "nolist" (myevalG T)))
 (test '(equal "nolist" (myevalG 3)))

 (myeval9 '(x print "aaa")) ; wird nicht ausgefuehrt, trotz eval
 (myeval9 '(print "aaa")) ; wird nicht ausgefuehrt, trotz eval
 (myeval2 '(print "aaa")) ; wird ausgefuehrt, vermutlich wegen dem if
 (myevalA '(print "aaa")) ; wird nicht ausgefuehrt - liegt also am if
 (myevalB '(print "aaa")) ; wird ausgefuehrt 
 (myevalC '(print "aaa")) ; wird nicht ausgefuehrt 
)

; siehe auch: eval-env, http://clisp.cons.org/impnotes/evaluation.html#eval-env

(print (funcall testobj 'result))

