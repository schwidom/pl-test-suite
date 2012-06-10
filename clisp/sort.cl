#!/usr/bin/clisp

(setf *print-circle* t)
(setf *print-case* :downcase) 

(require "testenv3.cl")

(defpackage current-test 
 (:import-from testenv3 test testobj)
)

(in-package current-test)

(funcall testobj :check-complain-and-adjust-expected 0)

(test '(functionp (symbol-function 'sort)))

(test '(equal '(1 3 2) (sort '(1 3 2) '=)))

(test '(equal '(1 2 3) (sort '(1 3 2) '<)))

(test '(equal '(3 2 1) (sort '(1 3 2) '>)))

(test '(equal '((1 3)(2 2)(3 1)) (sort '((1 3)(2 2)(3 1)) #'(lambda (x y) (< (car x) (car y))))))

(test '(equal '((3 1)(2 2)(1 3)) (sort '((1 3)(2 2)(3 1)) #'(lambda (x y) (> (car x) (car y))))))

(funcall testobj :check-complain-and-adjust-expected 6)

(let 
 ( (l '(1 1 2 2 3 3)) )
 (test '(equal '(1 2 3) (remove-duplicates l)))
 (test '(equal '(1 1 2 2 3 3) l))
 (test '(equal '(1 2 3) (delete-duplicates l)))
 (test '(equal '(1 1 2 3) l)) ; it seems to be buggy!
 (test '(equal '(1 2 3) (delete-duplicates l)))
 (test '(equal '(1 1 2 3) l)) ; it seems to be buggy!
 ; or the same problem, that nconc has?
)

(funcall testobj :check-complain-and-adjust-expected 6)

(let 
 ( (l '(root 1 1 2 2 3 3)) )
 (test '(equal '(root 1 2 3) (remove-duplicates l)))
 (test '(equal '(root 1 1 2 2 3 3) l))
 (test '(equal '(root 1 2 3) (delete-duplicates l)))
 (test '(equal '(root 1 2 3) l)) 
 ; or the same problem, that nconc has? yes!
)

(funcall testobj :check-complain-and-adjust-expected 4)

(print (funcall testobj :result))

