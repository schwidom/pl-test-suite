#!/usr/bin/clisp -E utf-8

(load "testenv.cl")

(defvar *htSymbols (make-hash-table))

(defmacro dont x)

;(defun scan_sources (fname)) ; warum das wohl wieder nicht geht?

(setf scan_sources_count 0)

;(setf *read-eval* T)

(defvar scan_sources

 (lambda (x) 

  (incf scan_sources_count)
  (print x)

  (let (( f (open x :external-format "utf-8")))
   
   (let ((eof "EOF"))
  
    (loop

     (let ((rod (read f NIL eof)))

      (if (eq rod eof)
       (return)
      )

      (dont (let ( (rod2 (expand-form rod)) )
  
       (dont 
        (print "|")
        (print rod)
        (print "-")
        (print rod2)
        (print "|")
       )
      ))
  
     )
    )
   )
  )
 )
)

(map NIL scan_sources (directory "/home/fschwidom/source/clisp-2.41/src/*.lisp"))

(print (format NIL "~s ~s" "scan_sources_count" scan_sources_count))

