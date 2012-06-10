
(defpackage testenv2)

(in-package testenv2)

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
;(defmacro test (l) `(eval ,(cadr l)))

(setf testobj (testclass))

(defmacro dont x)

(defmacro test (l) 

 `(let*     ; (pre-res res)
  ,(if (and (listp (cadr l)) (find (caadr l) '(eq equal eql equalp)))
   `((pre-res (list ,(list 'quote (caadr l)) (list 'quote ,(cadr (cadr l))) (list 'quote ,(caddr (cadr l)))))
     (res (eval pre-res)))
   `((res ,(cadr l))
     (pre-res NIL)))

  (if res 
   (progn
    (funcall testobj 'incok)
   )
   (progn
    (funcall testobj 'incfail)
    (print (format NIL "code: ~s" ,l))
    (print (format NIL "pre-res: ~s" pre-res))
    (print (format NIL "line: ~s" system::*current-source-line-1*))
    (dont (print (format NIL "line: ~s" system::*current-source-line-2*)))
    (print (format NIL "file ~s" system::*current-source-file*))
   )
  )
 )
)

(defmacro tested-loop (cnt &rest loopcode)
 `(test '(eq ,cnt (loop ,@loopcode count t))))

; siehe auch: eval-env, http://clisp.cons.org/impnotes/evaluation.html#eval-env

