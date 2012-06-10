#!/usr/bin/clisp

(setf *print-case* :downcase) ; darauf musste erstmal kommen
;(setf *print-readably* T) ; veraendert zu upcase und superausfuehrlich mit packages
(setf *print-rpars* T) ; sieht nicht verkehrt aus


(tagbody ; mit pprint verschoenert, kommentar aber erst nachher
 (let ((eof (gensym)))
  (handler-case
   (loop
    (let ((rod (read *standard-input* nil eof))) (when (eq eof rod) (go eof)) (pprint rod))
    (format *standard-output* "~%")
   )
   (condition (x) (format *standard-output* "error ~a" x))
 ))
 eof
)
;(handler-case (loop (pprint (read-char)) (format *standard-output* "~%")) (condition (x) NIL))

NIL

