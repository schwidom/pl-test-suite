#!/usr/bin/clisp

(defmacro dont x)

(let (( f (open "1.cl")))
 
 (let ((eof "EOF"))

  (loop
   
   (let ((rod (read f NIL eof)))
    (dont
     (print "|")
     (print rod)
     (print "|")
    )
    (if (eq rod eof)
     (return)
     (eval rod)
    )
   )
  )
 )
)
