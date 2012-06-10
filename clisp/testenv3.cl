
(defpackage testenv3)

(in-package testenv3)

(defun testclass ()
 (let ((testok 0) (testfail 0) (count-latest 0) (count-relative-expected 0))
  (let 
   (
    (testobj
     (lambda
      (instruction &rest r)
      (case instruction
       ('getok testok)
       ('getfail testfail)
       ('incok (incf testok 1))
       ('incfail (incf testfail 1))
       (:check-complain-and-adjust-expected
        (destructuring-bind (cnt) r
        (let* (
          (count-tests (+ testok testfail))
          (count-tests-local (- count-tests count-latest))
         )
         
         (setf count-latest count-tests)

         (if (eq count-tests-local cnt)
          t
          (progn
           (format t "Expected Test Count (from last checkpoint to here) doesn't match: count-tests-local: ~s count: ~s" count-tests-local cnt)
           nil
          )
         )
        )
        )
       )
       (:result (list "tests ok:" testok " fail: " testfail " count-latest " count-latest ))
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

