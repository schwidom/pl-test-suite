#!/usr/bin/clisp

(require "testenv2.cl")

(defpackage current-test 
 (:import-from testenv2 test testobj result)
)

(in-package current-test)

(test '(functionp (symbol-function 'every)))
(test '(functionp (symbol-function 'some)))
(test '(functionp (symbol-function 'notany)))
(test '(functionp (symbol-function 'notevery)))

(test '(every #'identity '(t t)))

(test '(every #'not '(nil nil)))
(test '(not (every #'not '(nil t))))
(test '(not (every #'not '(t t))))

(test '(some #'not '(nil nil)))
(test '(some #'not '(nil t)))
(test '(not (some #'not '(t t))))

(test '(not (notany #'not '(nil nil))))
(test '(not (notany #'not '(nil t))))
(test '(notany #'not '(t t)))


(test '(not (notevery #'not '(nil nil))))
(test '(notevery #'not '(nil t)))
(test '(notevery #'not '(t t)))

;see also identity.cl every.cl notany.cl notevery.cl some.cl 

(print (funcall testobj 'result))
