#!/usr/bin/clisp

(setf *print-circle* t)
(setf *print-case* :downcase) 

;(setq CUSTOM:*REPORT-ERROR-PRINT-BACKTRACE* t) ; liefert Stacktrace (leider ohne Zeilennummern)

; file:///home/fschwidom/doc/lisp/www.lispworks.com/documentation/HyperSpec/Body/f_abortc.htm

(require "testenv3.cl")

(defpackage current-test 
 (:import-from testenv3 test testobj)
)

(in-package current-test)

(funcall testobj :check-complain-and-adjust-expected 0)

(test '(functionp (macro-function 'handler-bind)))
(test '(functionp (symbol-function 'continue)))
(test '(functionp (symbol-function 'error)))
(test '(functionp (symbol-function 'cerror)))
(test '(functionp (symbol-function 'warn)))
(test '(functionp (symbol-function 'values)))

(funcall testobj :check-complain-and-adjust-expected 6)

(test '(eq nil (handler-bind ((condition #'(lambda (c) 2))
 (when t (condition "2") #|continuation dont appear|# 1))))) ; function condition is not defined

(setf lambda-test-and-throw-t #'(lambda (condition) (test 't) (throw 't condition)))
(setf lambda-2 #'(lambda (condition) 2))
(setf lambda-continue #'(lambda (condition) (continue)))
(setf lambda-continue-condition #'(lambda (condition) (continue condition)))
(setf lambda-muffle-warning #'(lambda (condition) (muffle-warning)))
(setf lambda-muffle-warning-condition #'(lambda (condition) (muffle-warning condition)))

;(test '(eq nil (handler-bind ((error #'(lambda (condition) (print "error") (continue condition))))
; (progn (error "2") #|continuation dont appear|# 1))))

;(test '(eq nil (handler-bind ((error lambda-continue))
; (progn (error "2") #|continuation dont appear|# 1))))

;(test '(eq nil (handler-bind ((error lambda-continue-condition))
; (progn (error "2") #|continuation dont appear|# 1))))

(catch 't
 (handler-bind ((error lambda-test-and-throw-t))
  (progn (error "2") #|continuation dont appear|# 1)
 )
 (test 'nil)
)

(test '(eq 1 (handler-bind ((error lambda-continue))
 (progn (cerror "3" "2") #|continuation appears here|# 1))))

(test '(eq 1 (handler-bind ((error lambda-2))
 (progn (cerror "3" "2") #|continuation appears also|# 1))))

(test '(eq 1 (handler-bind ((error lambda-continue))
 (progn (warn "3") #|continuation appears also|# 1))))

(test '(eq 1 (handler-bind ((error lambda-muffle-warning))
 (progn (warn "3") #|continuation appears also|# 1))))

(test '(eq 1 (handler-bind ((error lambda-muffle-warning-condition))
 (progn (warn "3") #|continuation appears also|# 1))))

(test '(eq 1 (handler-bind ((warning lambda-muffle-warning))
 (progn (warn "3") #|continuation appears also|# 1))))

(test '(eq 1 (handler-bind ((warning lambda-muffle-warning-condition))
 (progn (warn "3") #|continuation appears also|# 1))))

(test '(not (boundp 'a)))

(catch 't
 (handler-bind ((unbound-variable lambda-test-and-throw-t))
  (progn (setf b a))
 )
 (test 'nil)
)

(catch 't
 (handler-bind ((error lambda-test-and-throw-t))
  (progn (setf b a))
 )
 (test 'nil)
)

(test '(not (boundp 'a)))

(funcall testobj :check-complain-and-adjust-expected 7)

;see also handler-bind.cl, handler-case.cl
;see also catch.cl, throw.cl

(print (funcall testobj :result))

