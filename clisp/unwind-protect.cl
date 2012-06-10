#!/usr/bin/clisp

(load "testenv.cl")

(test '(not (functionp (symbol-function 'unwind-protect))))

(test '(eq 2 (unwind-protect 2 1)))

(test '(eq 1 (catch 'a (unwind-protect (throw 'a 2) (throw 'a 1)))))

(let (( x 1))

 (test '(eq 1 (catch 'a (unwind-protect (incf x) (throw 'a 1)))))

 (test '(eq 2 x))
)

(let (( x 1))

 (test '(eq 1 (catch 'a (unwind-protect (throw 'a 1) (incf x)))))

 (test '(eq 2 x))
)

(let (( x 1))
 
 (tagbody
  (unwind-protect
   (go out)
   (incf x)
  )
  out
 )

 (test '(eq 2 x))
)

(let (( x 1))
 
 (tagbody
  (unwind-protect
   ;(go out)
   (incf x)
  )
  out
 )

 (test '(eq 2 x))
)
; see also catch.cl

(print (funcall testobj 'result))
