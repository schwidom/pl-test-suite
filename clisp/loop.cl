#!/usr/bin/clisp

(load "testenv.cl")

(test '(not (functionp (symbol-function 'loop))))
(test '(functionp (macro-function 'loop)))

;(test '(eq T (not NIL)))

(loop named name
 until T
)

(loop for i from 1 to 10
)

(test '(equal '(1 2 3)
 (loop for i from 1 to 3
  collect i
 ))
)

(loop
 while NIL
)

(loop
(return)
)

(test '(equal '((1 2)(2 3)(3 4)) (loop
 for i from 1 to 3
 for k from 2 to 4
 collect (list i k))))

(test '(equal '((1 2)(2 3)(3 4)) (loop
 for i from 1 to 3
 for k from 2 to 5
 collect (list i k))))

(test '(equal '((1 2)(2 3)(3 4)) (loop
 for i from 1 to 4
 for k from 2 to 4
 collect (list i k))))

(test '(equal '((1 2)(2 3)(3 4)) (loop
 for i in '(1 2 3)
 for k from 2 to 4
 collect (list i k))))

(test '(equal '((1 2 3 4)(2 3 4)(3 4)(4)) (loop
 for i on '(1 2 3 4)
 collect i)))

(test '(equal '((1 2 3 4)(2 3 4)(3 4)(4)) (loop
 for i on '(1 2 3 4) by #'cdr
 collect i)))

(test '(equal '((1 2 3 4)(3 4)) (loop
 for i on '(1 2 3 4) by #'cddr
 collect i)))

(test '(equal '(1 2 3 4) (loop
 for i across #(1 2 3 4)
 collect i)))

(defvar *ht* (make-hash-table))

(setf (gethash 'k *ht*) 'v)

(test '(equal '(k) (loop
 for i being the hash-keys in *ht* collect i))) 

(test '(equal '(v) (loop
 for i being the hash-values in *ht* collect i)))

(test '(equal '((k v)) (loop
 for i being the hash-keys in *ht* using (hash-value l) collect (list i l)))) 


(test '(equal '(root 1 2 3 fine)

 (let ((l '(root)))
 
  (loop
   for i in '(1 2 3)
   do (nconc l (list i))
   finally (nconc l '(fine))
  )
 l )
))

(test '(equal '(root 1 a 2 a 3 fine)

 (let ((l '(root)))
 
  (loop
   for (i . rest) on '(1 2 3)
   do (nconc l (list i))
   when rest do (nconc l (list 'a)) ; (nconc l '(a)) loops forever
   finally (nconc l '(fine))
  )
 l )
))

(test '(equal '(1 6 7 2 6 7) (loop for i in '(1 2) collect i append '(6 7))))

(print (funcall testobj 'result))


