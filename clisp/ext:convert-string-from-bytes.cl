#!/usr/bin/clisp

(setf *print-circle* t)
(setf *print-case* :downcase) 

(require "testenv3.cl")

(defpackage current-test 
 (:import-from testenv3 test testobj)
)

(in-package current-test)

(funcall testobj :check-complain-and-adjust-expected 0)

(let ((str (coerce #( #\latin_small_letter_a_with_diaeresis) 'string)))

 (test '(equal str (ext:convert-string-from-bytes #( #xe4) "iso-8859-1")))
 (test '(equal str (ext:convert-string-from-bytes #( #xc3 #xa4) "utf-8")))

 (test '(equalp #( #xe4) (ext:convert-string-to-bytes str "iso-8859-1")))
 (test '(equalp #( #xc3 #xa4) (ext:convert-string-to-bytes str "utf-8")))
)

(funcall testobj :check-complain-and-adjust-expected 4)

(print (funcall testobj :result))

; see also: ext:convert-string-to-bytes.cl ext:convert-string-from-bytes.cl
