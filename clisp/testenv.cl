(defun testclass ()
 (let ((testok 0) (testfail 0))
  (let 
   (
    (testobj
     (lambda
      (instruction)
      (case instruction
       ('getok testok)
       ('getfail testfail)
       ('incok (incf testok 1))
       ('incfail (incf testfail 1))
       ('result (list "tests ok:" testok " fail: " testfail))
       (otherwise 'symbol-not-defined)
      )
     )
    )
   )
   testobj
  )
 )
)

;(setf tests 0)

(setf testobj (testclass))

(defmacro dont x)

(defmacro test (l) 
 
 `(let ( (res ,(eval l)))
  (if res 
   ;(incf tests)
   (funcall testobj 'incok)
   ;(print 't)
   (progn
    (funcall testobj 'incfail)
    (print (format NIL "code: ~s" ,l))
    (print (format NIL "line: ~s" system::*current-source-line-1*))
    (dont (print (format NIL "line: ~s" system::*current-source-line-2*)))
    (print (format NIL "file ~s" system::*current-source-file*))
   )
  )
 )
)

