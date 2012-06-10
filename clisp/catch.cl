#!/usr/bin/clisp

(setf *print-circle* t)
(setf *print-case* :downcase) 

(require "testenv3.cl")

(defpackage current-test 
 (:import-from testenv3 test testobj)
)

(in-package current-test)

(funcall testobj :check-complain-and-adjust-expected 0)

(test '(not (functionp (symbol-function 'catch))))
(test '(not (functionp (symbol-function 'throw))))

(test '(not (functionp (macro-function 'catch))))
(test '(not (functionp (macro-function 'throw))))

(test '(special-operator-p 'catch))
(test '(special-operator-p 'throw))

(funcall testobj :check-complain-and-adjust-expected 6)

(test '(eq 2 (catch 'b 2)))

(test '(eq 2 (catch 'b 1 2)))

(test '(eq 2 (catch 'b (throw 'b 2))))

(test '(eq 2 (catch 'b (catch 'b (throw 'b 2)))))


(defun g () (throw 'b 2))
(test '(eq 2 (catch 'b (g))))

(test '(eq 2 (catch 3 (throw 3 2))))

(test '(eq 2 (catch :a (throw :a 2))))

(test '(eq 2 (catch #\a (throw #\a 2))))

;(test '(eq 2 (catch 3.3 (throw 3.3 2))))

;(test '(eq 2 (catch "a" (throw "a" 2))))

;(test '(eq 2 (catch '(1 3) (throw '(1 3) 2))))

; see also unwind-protect.cl

(funcall testobj :check-complain-and-adjust-expected 8)

;see also catch.cl, throw.cl
;see also handler-bind.cl, handler-case.cl

(print (funcall testobj :result))
