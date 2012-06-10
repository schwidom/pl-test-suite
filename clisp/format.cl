#!/usr/bin/clisp


(load "testenv.cl")

(test '(functionp (symbol-function 'format)))

(test '(equal "A" (format NIL "~s" 'a)))
(test '(equal "(1 2 3)" (format NIL "~s" '(1 2 3))))

(test '(equal "A" (format NIL "~d" 'a)))
(test '(equal "(1 2 3)" (format NIL "~d" '(1 2 3))))

(test '(equal "A" (format NIL "~S" 'a)))
(test '(equal "(1 2 3)" (format NIL "~S" '(1 2 3))))

(test '(equal "A" (format NIL "~S" 'a NIL)))
(test '(equal "A" (format NIL "~S" 'a T)))

(test '(equal "\"a\"" (format NIL "~S" "a")))
(test '(equal "\"a\"" (format NIL "~s" "a")))
(test '(equal "a" (format NIL "~d" "a")))
(test '(equal "a" (format NIL "~D" "a")))


(print (funcall testobj 'result))

