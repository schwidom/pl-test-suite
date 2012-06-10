#!/usr/bin/clisp

(require "testenv2.cl")

(defpackage current-test 
 (:import-from testenv2 test testobj result)
)

(in-package current-test)

(flet ((f (x) (test '(eq 10 x))))
 (f 10)
)

(labels ( (f (x) (if (eq 0 x) (test 't) (f (- x 1))  )) )
 (f 1000)
) ; mit labels ist eine rekursion moeglich, mir flet nicht

(defun f (x &aux (cnt 0))
 (incf cnt)
 (labels ( (f (x) (if (eq 0 x) (test '(eq 1 cnt)) (f (- x 1))  )) )
  (f x)
 ) ; mit labels ist eine rekursion moeglich, mir flet nicht
) ; und mit labels ist es im ggs zu flet moeglich, die inner funktion mit demselben namen zu rufen

(f 1000)

; siehe auch: labels, flet, symbol-macrolet, macrolet

(print (funcall testobj 'result))

