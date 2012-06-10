#!/usr/bin/clisp

(load "testenv.cl")

(test '(eq NIL (compiler::line-number *standard-output*)))

(print (funcall testobj 'result))
