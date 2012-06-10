#!/usr/bin/clisp


(load "testenv.cl")

(test '(functionp (symbol-function 'open)))
(test '(functionp (symbol-function 'write)))
(test '(functionp (symbol-function 'read-line)))
(test '(functionp (symbol-function 'close)))

(let ((f (open "work/1.txt" :direction :output :if-does-not-exist :create)))
 (write "hello world" :escape NIL :stream f)
 (write (format NIL "~%") :escape NIL :stream f) ; test gelingt unabhaengig von CR LF
 (close f)
)

(let ((f (open "work/1.txt" :direction :input)))
 (let ((eof "EOF"))
  (loop
   (let ((rod (read-line f  NIL eof)))
    (if (eq rod eof)
     (return)
     (test '(equal rod "hello world"))
    )
   )
  )
 )

 (close f)
)



(print (funcall testobj 'result))

