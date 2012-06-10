#!/usr/bin/clisp

(load "testenv.cl")

(test '(eq 5 system::*current-source-line-1*))

(test '(eq 7 system::*current-source-line-2*))

(test '(equal  "line_file" (pathname-name system::*current-source-file*)))
(test '(equal "cl" (pathname-type system::*current-source-file*)))

(print (funcall testobj 'result))
