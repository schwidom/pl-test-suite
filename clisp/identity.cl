#!/usr/bin/clisp

(setf *print-circle* t)
(setf *print-case* :downcase) 

(require "testenv3.cl")

(defpackage current-test 
 (:import-from testenv3 test testobj)
)

(in-package current-test)

(funcall testobj :check-complain-and-adjust-expected 0)

(test '(functionp (symbol-function 'identity)))

(funcall testobj :check-complain-and-adjust-expected 1)

(let ((sym (gensym)))
 (test '(eq sym (identity sym)))
)

(funcall testobj :check-complain-and-adjust-expected 1)

;see also identity.cl every.cl notany.cl notevery.cl some.cl 

(print (funcall testobj :result))
