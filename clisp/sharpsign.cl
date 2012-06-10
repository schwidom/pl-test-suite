#!/usr/bin/clisp

(load "testenv.cl")

(test '(equal 'FUNCTION (type-of #'(lambda ()))))

;(test '(equal 1 (#'(lambda () 1)))) ; will nicht
(test '(equal 1 (funcall #'(lambda () 1))))
(test '(equal 1 (funcall (lambda () 1))))
(test '(equal 1 ((lambda () 1))))
(test '(equal 1 (let () #1=#'(lambda () 1) (funcall #1#))))

(test '(equal '(SIMPLE-VECTOR 2) (type-of #(1 2))))
(test '(equal '(SIMPLE-VECTOR 3) (type-of #(1 3 2))))
(test '(equal '(SIMPLE-VECTOR 4) (type-of #(1 3 2 4))))

(test '(equalp #(a b c c c c) #(a b c c c c)))
(test '(equalp #(a b c c c c) #6(a b c )))

(test '(equal '(SIMPLE-BIT-VECTOR 2) (type-of #*11)))
(test '(equal '(SIMPLE-BIT-VECTOR 3) (type-of #*101)))
(test '(equal '(SIMPLE-BIT-VECTOR 4) (type-of #*1011)))

(test #(equal #*10111 #5*101))

(test '(equal '(SIMPLE-ARRAY T (2 2)) (type-of #2A((1 2) (3 4)))))

(test '(eq 'STANDARD-CHAR (type-of #\a)))

; #+ , #- , #: noch nicht kapiert

(test '(eq 1 #.1))

(test '(eq 'a #.''a))
(test '(not (eq 'a #.''b)))

(test '(eq 'COMPLEX (type-of #c(2 4))))

(test '(eq 16 #x10)) ; hex

(print (funcall testobj 'result))
