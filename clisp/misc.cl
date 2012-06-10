#!/usr/bin/clisp

(load "testenv.cl")

(test '(functionp (symbol-function 'mapcar)))
(test '(not (functionp (symbol-function 'function))))

(test '(equal '(2 3 4) (mapcar (function +) '(1 2 3) '#1=(1 . #1#))))

(test '(string< "" NIL))
(test '(string< NIL "a"))
(test '(string< "" "a"))
(test '(string< "a" "aa"))
(test '(string< "a" "b"))
(test '(string< "A" NIL))
(test '(string< NIL "Z"))
(test '(string< NIL "NILA"))
(test '(string< "NI" NIL))
(test '(string< "S" T))
(test '(string< T "Ta"))
(test '(string< "A" 'aa))
(test '(string< "A" :aa))

(let ((cnt 0))
 (test 
  '(eq nil 
    (tagbody 
     (mapcar 
      #'(lambda (x) 
         (incf cnt) 
         (go end)) 
      '(1 2 3))
      end)))

 (test '(eq 1 cnt)))

;(defmacro ex (x) (print "ex") (print x) (cadr x))
(defmacro ex (x) (cadr x))

(defmacro m (x) `(let ((a 1)) ,(cadr x)))


(test '(eq 1 (m 'a)))

(test '(symbolp (read-from-string "a")))

(let ((x 'a))
 (test '(eq 1 (ex '(m 'a))))
 (test '(eq 1 (ex `(m 'a))))
 (test '(eq 'a (ex `(m ,x)))) ; die frage ist: was wird an ex uebergeben? entweder '(m 'a), das kann aber nicht sein, dann also `(m ,x) und die expansion erfolgt nach beenden des makros - tatsaechlich, es liess sich per print nachweisen; d.h. also macros haben vorrang vor unquote
)

(defun a () 1)
(setf a #'a)
(defun a () 2)
(test '(eq 1 (funcall a)))
(test '(eq 2 (a)))

(print (funcall testobj 'result))

