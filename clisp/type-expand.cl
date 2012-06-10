#!/usr/bin/clisp

(setf *print-circle* t)
(setf *print-case* :downcase) 

(require "testenv3.cl")

(defpackage current-test 
 (:import-from testenv3 test testobj)
 (:import-from ext type-expand)
 (:import-from ext letf)
)

(in-package current-test)

(funcall testobj :check-complain-and-adjust-expected 0)

(test '(equal '(1 2 3) (multiple-value-list (multiple-value-call #'values 1 2 3))))

(letf (((values a b c) (multiple-value-call #'values 1 2 3)))
 (test '(eq 1 a))
 (test '(eq 2 b))
 (test '(eq 3 c))
)

(funcall testobj :check-complain-and-adjust-expected 4)

(test '(equal '(cons nil) (multiple-value-call #'list (type-expand 'cons))))
(test '(equal '((cons) nil) (multiple-value-call #'list (type-expand '(cons)))))

(deftype eins-or-zwei () `(or (eql 1) (eql 2)))

(test '(equal '((or (eql 1) (eql 2)) t) (multiple-value-call #'list (type-expand '(eins-or-zwei)))))

(funcall testobj :check-complain-and-adjust-expected 3)

;(defun b-eins-or-zwei (x) (or (eq 1 x) (eq 2 x)))
;(deftype eins-or-zwei-2 () `(satisfies b-eins-or-zwei))


; see also : multiple-value-list.cl, values.cl, type-expand.cl

(print (funcall testobj :result))

