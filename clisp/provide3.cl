#!/usr/bin/clisp

(setf *print-circle* t)
(setf *print-case* :downcase) 

(require "testenv3.cl")
(require "work/../defines-constant.cl")
(provide "work/../defines-constant.cl")
(require "defines-constant.cl") ; error appears

; consequences: is an file Y required, which stands in another directory and does Y itself require and provide an file X, which is there local existing, then a file with the same name in the current directory cannot required. a workaround for this problem is to to qualify the path either from the base-directory on or to use an uniq qualifying directory per directory

; examples:
; (require "uniq0815/../to-require.cl) ; qualified by directory-qualifier
; (provide "uniq0815/../to-require.cl)

; (require "../projectname/to-require.cl)
; (provide "../projectname/to-require.cl) ; qualified by base-directory



(defpackage current-test 
 (:import-from testenv3 test testobj)
 (:import-from defines-constant +DEFINED-CONSTANT-I+)
)

(in-package current-test)

(funcall testobj :check-complain-and-adjust-expected 0)

(test '(eq 2 +DEFINED-CONSTANT-I+))

(funcall testobj :check-complain-and-adjust-expected 1)

; see prev provide2.cl

(print (funcall testobj :result))

