#!/usr/bin/clisp

(require "testenv2.cl")

(defpackage current-test 
 (:import-from testenv2 test testobj result)
)

(in-package current-test)

(test '(functionp (symbol-function 'find)))

(test '(eq 1 (first '(1 2 3))))
(test '(eq 2 (second '(1 2 3))))

(test '(eq 'b (find 'b '(a b c))))
(test '(eq NIL (find 'd '(a b c))))
(test '(eq NIL (find NIL '(a b c))))
(test '(eq NIL (find NIL '(a b c NIL))))

(test '(equal '(1 2) (find 2 #((2 3) (1 2)) :key #'second)))
(test '(equal '(1 2) (find 2 '((2 3) (1 2)) :key #'second)))

(test '(equal '(1 2) (find 1 '((2 3) (1 2)) :key #'first)))
(test '(equal '(2 3) (find 2 '((2 3) (1 2)) :key #'first)))
(test '(equal NIL (find 5 '((2 3) (1 2)) :key #'first)))

(test '(equal '(1 2) (find 1 '((2 3) (1 2)) :test #'equal :key #'first)))

(test '(equal NIL (find 2 '((2 3) (1 2)) :test #'(lambda (x y) NIL) :key #'first)))

(print (funcall testobj 'result))

