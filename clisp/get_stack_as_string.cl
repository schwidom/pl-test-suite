#!/usr/bin/clisp

; aus: http://paste.lisp.org/display/58229

; GET-STACK-AS-STRING - Get the stack as a string for inclusion error message
(defun get-stack-as-string (&optional (nskip 0))
  ; Skip to first relevant EVAL frame
  (do* ((result (make-string-output-stream))
        (mode 4)
        (frame (system::the-frame) (system::frame-up-1 frame mode))
        (last (system::frame-up frame 5))
        (count 0 (1+ count))
        (at-last nil))
       (at-last (get-output-stream-string result))
       (cond ((< count nskip) )
             ((= count nskip)
              (system::describe-frame result frame)
              (setf mode 5))
             ((equal frame last)
              (setf at-last t))
             (t
              (system::describe-frame result frame)))));;get-stack-as-string


(print (get-stack-as-string))

((lambda () (print (get-stack-as-string))))

(defun f () (print (get-stack-as-string)))
(f)

(defun g () (f))

(g)

; noch nicht zufriedenstellend
; es geht auch: (show-stack &OPTIONAL ARG0 ARG1 ARG2), das printet aber auf die Konsole
