#!/usr/bin/clisp

(setf *print-circle* t)
(setf *print-case* :downcase) 

(require "testenv2.cl")

(defpackage current-test 
 (:import-from testenv2 test testobj result)
)

(in-package current-test)

(setf open-parenthesis #\()
(setf close-parenthesis #\))

#|{|#
(defun open-bracket-macro-character (stream char) `',
 (read-delimited-list #\] stream t)
)

(set-macro-character #\[ #'open-bracket-macro-character)
(set-macro-character #\] (get-macro-character close-parenthesis))


(test '(equal '(1 2 3) [1 2 3])) 
#|}|#


#|{|#
(defun open-bracket-macro-character (stream char) 
 (read-delimited-list #\] stream t)
)

(set-macro-character #\[ #'open-bracket-macro-character)

(set-macro-character #\] (get-macro-character close-parenthesis))


(test '(equal '(1 2 3) '[1 2 3])) ; mzscheme like
#|}|#


(print (funcall testobj 'result))
