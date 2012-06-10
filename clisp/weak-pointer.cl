#!/usr/bin/clisp

(require "testenv2.cl")

(defpackage current-test 
 (:import-from testenv2 test testobj result)
 (:import-from ext make-weak-pointer weak-pointer-value)
)

(in-package current-test)

(setf wp (make-weak-pointer "hallo"))

(test '(equal "hallo" (weak-pointer-value wp))) ; der Jammer - nicht freigegeben

(print (funcall testobj 'result))
