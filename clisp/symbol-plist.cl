#!/usr/bin/clisp

(require "testenv2.cl")

(defpackage current-test 
 (:import-from testenv2 test testobj result)
)

(in-package current-test)

(test '(functionp (symbol-function 'symbol-plist)))
(test '(functionp (symbol-function 'get)))
(test '(functionp (symbol-function 'remprop)))

; baustelle: symboltypen feststellen fuer symbol-plist, get, remprop

(test '(not (find-symbol "A"))) ; Voraussetzung fuer diese Test

(test '(equal '() (symbol-plist 'a)))

(setf (get 'a 'x) 'y)

(test '(eq 'y (get 'a 'x)))

(test '(equal '(x y) (symbol-plist 'a)))

; siehe auch: sys::definition.cl

(print (funcall testobj 'result))
