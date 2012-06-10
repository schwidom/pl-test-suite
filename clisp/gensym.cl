#!/usr/bin/clisp

(setf *print-circle* t)
(setf *print-case* :downcase) 

(require "testenv3.cl")

(defpackage current-test 
 (:import-from testenv3 test testobj)
)

(in-package current-test)

(funcall testobj :check-complain-and-adjust-expected 0)

(let* ((s (gensym)) (sn (symbol-name s)))
 (test '(eq s s))
 (test '(not (eq s (make-symbol sn))))
 (test '(not (eq s (find-symbol sn))))
)

(funcall testobj :check-complain-and-adjust-expected 3)

; see also export.cl find-package.cl find-symbol.cl gensym.cl gentemp.cl intern.cl make-symbol.cl 

(print (funcall testobj :result))
