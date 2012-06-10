#!/usr/bin/clisp

(defmacro dont x)

(let (( f (open "1.cl")))
 
 (let ((eof "EOF"))

  (loop
   
   (let ((rod (read f NIL eof)))
    (let ( (rod2 (expand-form rod)) )

     (dont 
      (print "|")
      (print rod)
      (print "-")
      (print rod2)
      (print "|")
     )

     (if (eq rod eof)
      (return)
      (eval rod2)
     )
    )
   )
  )
 )
)
