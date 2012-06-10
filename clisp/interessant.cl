#!/usr/bin/clisp

(setq CUSTOM:*REPORT-ERROR-PRINT-BACKTRACE* T) ; liefert Stacktrace (leider ohne Zeilennummern)

; file:///home/fschwidom/doc/lisp/www.lispworks.com/documentation/HyperSpec/Body/f_abortc.htm

(load "testenv.cl")

(print (handler-bind ((error #'(lambda (c) 2))) (error "hallo")))

(print (funcall testobj 'result))
