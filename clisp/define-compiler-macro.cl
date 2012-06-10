#!/usr/bin/clisp

; file:///home/fschwidom/doc/lisp/www.lispworks.com/documentation/HyperSpec/Body/m_define.htm

(require "testenv2.cl")

(defpackage current-test 
 (:import-from testenv2 test testobj result)
)

(in-package current-test)

(define-compiler-macro f (x) x)

(test '(eq 2
 (funcall (compiler-macro-function 'f) '(f 2) nil)
))

(test '(equal '(f 2)
 (funcall (compiler-macro-function 'f) '(f (f 2)) nil)
))

(test '(eq 2
 (funcall (compiler-macro-function 'f) '(funcall #'f 2) nil)
))


(print (funcall testobj 'result))
