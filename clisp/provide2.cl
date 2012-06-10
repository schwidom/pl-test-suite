#!/usr/bin/clisp

(setf *print-circle* t)
(setf *print-case* :downcase) 

(require "testenv3.cl")
(require "defines-constant.cl")
(provide "defines-constant.cl"); aha, jetzt tritt der fehler nicht mehr auf - provide registriert den namen in den geladenen modulen und dann kann require den namen kein zqeites mal laden. das bedeutet, dass (provide "defines-constant.cl") eigentlich in die zu includende Datei gehoert, dann stellt sich aber immer noch die Frage, wie mit Verzeichnissen umgegangen wird.
(require "defines-constant.cl")

(defpackage current-test 
 (:import-from testenv3 test testobj)
 (:import-from defines-constant +DEFINED-CONSTANT-I+)
)

(in-package current-test)

(funcall testobj :check-complain-and-adjust-expected 0)

(test '(eq 1 +DEFINED-CONSTANT-I+))

(funcall testobj :check-complain-and-adjust-expected 1)

; see prev require2.cl
; see next provide3.cl

(print (funcall testobj :result))

