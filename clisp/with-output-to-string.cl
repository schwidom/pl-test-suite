#!/usr/bin/clisp

(require "testenv2.cl")

(defpackage current-test 
 (:import-from testenv2 test testobj result)
)

(in-package current-test)

;; aus: file:///home/fschwidom/doc/lisp/www.lispworks.com/documentation/HyperSpec/Body/m_w_out_.htm

(setq fstr 
 (make-array '(0) 
  :element-type 'base-char 
  :fill-pointer 0 
  :adjustable t))

(with-output-to-string (s fstr)
 (format s "here's some output")
 (input-stream-p s))

(test '(equal "here's some output" fstr))

(print (funcall testobj 'result))
