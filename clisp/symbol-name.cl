#!/usr/bin/clisp

(require "~/dev/clisp/lib/testenv2.cl")

(defpackage current-test 
 (:import-from testenv2 test testobj result)
)

(in-package current-test)

(setf *print-case* :upcase)

(test '(equal "A" (symbol-name 'a)))

(setf *print-case* :downcase)

(test '(equal "A" (symbol-name 'a))) ; unveraendert

(test '(equal "a" (string-downcase (symbol-name 'a)))) ; dann eben so!

(print (funcall testobj 'result))
