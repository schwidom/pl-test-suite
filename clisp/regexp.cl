#!/usr/bin/clisp

(load "testenv.cl")

(test '(functionp (symbol-function 'regexp::match-start)))
(test '(functionp (symbol-function 'regexp::match-end)))

(test '(eq 3 (regexp::match-start (REGEXP::match "::" "abc::"))))
(test '(eq 5 (regexp::match-end (REGEXP::match "::" "abc::"))))

(print (funcall testobj 'result))

