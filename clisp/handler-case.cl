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

(test '(functionp (symbol-function 'continue)))
(test '(functionp (symbol-function 'error)))
(test '(functionp (symbol-function 'cerror)))
(test '(functionp (symbol-function 'warn)))

(test '(functionp (macro-function 'handler-case)))
(test '(functionp (symbol-function 'values)))

(funcall testobj :check-complain-and-adjust-expected 6)

(test '(eq 101 (handler-case (error 1) (error (x) (with-slots (system::$datum) x (+ 100 system::$datum))))))

(test '(eq 101 (handler-case (warn 1) (error (x) (with-slots (system::$datum) x (+ 100 system::$datum))))))

(test '(eq 101 (handler-case (cerror 2 1) (error (x) (with-slots (system::$datum) x (+ 100 system::$datum))))))

(test '(eq 1 (handler-case (progn 1) (error (x) (with-slots (system::$datum) x (+ 100 system::$datum))))))

(test '(eq 1 (handler-case (progn 1) (error (x) (with-slots (system::$datum) x (+ 100 system::$datum))))))

(test '(eq 11 (handler-case (progn 1) (error (x) (with-slots (system::$datum) x (+ 100 system::$datum))) (:no-error (x) (+ 10 x)) )))

(test '(eq 13 (handler-case (values 1 2) (error (x) (with-slots (system::$datum) x (+ 100 system::$datum))) (:no-error (x y) (+ 10 x y)) )))

(test '(equal "y" (handler-case (warn "x") (condition (x) "y")))) ; neu, die condition ( steht offenbar ueber dem error)

(funcall testobj :check-complain-and-adjust-expected 8)

(warn "a") ; run thru with warnings
(cerror "a" "b") ; run thru with warnings

(funcall testobj :check-complain-and-adjust-expected 0)

(test '(eq 'cer
(handler-case ; continuation inside handler-case not possible

 (progn
  (test 't)
  (cerror "a ~s" "b ~s" 99) 
  (test 'nil)
  (cerror "a ~s" "b ~s" 99) 
  (test 'nil)
  (test 'nil)
  'pro
 )

 (error (x) 
  (test '(equal "b ~s" (simple-condition-format-control x)))
  (test '(equal "b ~s" (ext::simple-condition-format-string x)))
  (test '(equal '(99) (simple-condition-format-arguments x)))

  (continue x)

  ;(let ((r (find-restart 'cerror x)))
  ; (test '(not r))
  ; (when r (invoke-restart r)))

  (test 't)
  'cer
 )
)))

(funcall testobj :check-complain-and-adjust-expected 6)

(test '(eq 'cer
(handler-case ; continuation inside handler-case not possible

 (progn
  (test 't)
  (cerror "a ~s" "b ~s" 99) 
  (test 'nil)
  (cerror "a ~s" "b ~s" 99) 
  (test 'nil)
  (test 'nil)
  'pro
 )

 (warning (x) 

  ;(test '(equal "b ~s" (simple-condition-format-control x))) ; enthaelt funktion
  ;(test '(equal "b ~s" (ext::simple-condition-format-string x)))
  (test '(equal 'nil (simple-condition-format-arguments x)))

  (funcall (simple-condition-format-control x) t) ; outputs "b 99~%a 99", when t
  
  ;(continue x)

  ;(let ((r (find-restart 'cerror x)))
  ; (test '(not r))
  ; (when r (invoke-restart r)))

  (test 't)
  'cer
 )
)))

(funcall testobj :check-complain-and-adjust-expected 4)

;see also handler-bind.cl, handler-case.cl

(print (funcall testobj :result))

