#!/usr/bin/clisp

;(provide 'packages)
;(provide 'packages2)
;(require 'packages)
;(require 'packages2)

;(in-package 'packages)

(defpackage testpackage0)

(in-package testpackage0)

(load "testenv.cl")

(test '(equal "TESTPACKAGE0" (package-name *package*)))

(in-package COMMON-LISP-USER) ; wieder normal

;(import 'testpackage0::test)

;(test '(equal "COMMON-LISP-USER" (package-name *package*))) ; test<nicht definiert

(defpackage testpkg
 (:import-from testpackage0 test testobj dont testclass)
)

(setf a 1)

(testpackage0::test '(boundp 'a))

(in-package testpkg) ; will nicht, funcall testpackage0::testobj geht nachher nicht

(test 't); wird durch :import-from ermoeglicht

(test '(not (boundp 'a)))

(test '(boundp 'COMMON-LISP-USER::a))

(test '(eq 'testpackage0::symbol-not-defined (funcall testpackage0::testobj 'result)))

(print (funcall testobj 'testpackage0::result))


