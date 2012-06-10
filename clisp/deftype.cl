#!/usr/bin/clisp

(require "testenv2.cl")

(defpackage current-test 
 (:import-from testenv2 test testobj result)
)

(in-package current-test)

(defun b-eins-or-zwei (x) (or (eq 1 x) (eq 2 x)))

(deftype eins () `(eql 1))

(coerce 1 'eins)
(test '(typep 1 'eins))

(type-of (coerce 1 'eins))

(deftype eins-or-zwei () `(or (eql 1) (eql 2)))

(type-of (coerce 1 'eins-or-zwei))

(test '(typep 1 'eins-or-zwei))
(test '(typep 2 'eins-or-zwei))

(test '(typep 1 '(satisfies b-eins-or-zwei)))

(deftype eins-or-zwei-2 () `(satisfies b-eins-or-zwei))

(test '(typep 1 'eins-or-zwei-2))
(test '(typep 2 'eins-or-zwei-2))

;(print (class-of eins-or-zwei))

;(print t_eins-or-zwei)
;(print (type-of t_eins-or-zwei))

;(coerce 1 'eins-or-zwei)

;(print (type-of 1))
;(print (type-of 'eins-or-zwei))

;(eins-or-zwei 1)

(defgeneric g (a))
(defmethod g ((a (eql 1))) 'eins)
;(defmethod g ((a (satisfies b-eins-or-zwei))) 'eins) ; will nur klassen

(print (funcall testobj 'result))
