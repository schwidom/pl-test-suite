#!/usr/bin/clisp

(print (loop for code from 0 below char-code-limit collect (char-name (code-char code))))

; see also http://darcs.informatimago.com/lisp/common-lisp/character-sets.lisp
