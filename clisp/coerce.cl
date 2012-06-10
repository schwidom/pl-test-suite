#!/usr/bin/clisp

(require "testenv2.cl")

(defpackage current-test 
 (:import-from testenv2 test testobj result)
)

(in-package current-test)

(test '(functionp (symbol-function 'coerce)))

(test '(equal "ab" (coerce #(#\a #\b) 'string)))

(test '(not (equal "ab" (coerce #(#\a #\Nul #\b) 'string))))

(test '(equal 3 (length (coerce #(#\a #\Nul #\b) 'string))))

(test '(equal 5 (length (coerce #(#\Nul #\a #\Nul #\b #\Nul) 'string))))

(test '(equal "ab" (format NIL "~d" (coerce #(#\a #\b) 'string))))

(test '(not (equal "ab" (format NIL "~d" (coerce #(#\a #\Nul #\b) 'string)))))

(test '(equalp #(1 2 3) (coerce '(1 2 3) 'vector)))
(test '(equalp #(1 2 3) (coerce #(1 2 3) 'vector)))
(test '(equalp '(1 2 3) (coerce #(1 2 3) 'list)))
(test '(equalp '(1 2 3) (coerce '(1 2 3) 'list)))

(test '(eq #\a (coerce "a" 'character)))

(test '(eq 3.0S0 (coerce 3 'short-float)))

(test '(eq 'x (coerce 'x 't)))

(test '(eq 'x (coerce 'x t)))

(test '(eq 'x (identity 'x)))

;(test '(eq 3 (coerce 3.0 'integer)))

(test '(eq 10 (char-code #\Newline)))
(test '(eq #\Newline (code-char 10)))

; stichwort: cast

(print (funcall testobj 'result))

