#!/usr/bin/clisp

(require "testenv2.cl")

(defpackage current-test 
 (:import-from testenv2 test testobj result)
)

(in-package current-test)

(test '(not (functionp (symbol-function 'defparameter))))
(test '(functionp (macro-function 'defparameter)))
(test '(not (functionp (symbol-function 'defvar))))
(test '(functionp (macro-function 'defvar)))
(test '(not (functionp (symbol-function 'defconstant))))
(test '(functionp (macro-function 'defconstant)))

(defparameter *p* 1)

(test '(eq 1 *p*))

(defparameter *p* 2)

(test '(eq 2 *p*))

(defconstant C 1)

(test '(eq 1 C))

(defconstant C 1) ; ohne fehlermeldung

(defconstant C 2) ; mit fehlermeldung

(test '(eq 2 C))

(defvar *v* 1)

(test '(eq 1 *v*))

(defvar *v* 2)

(test '(eq 1 *v*)) ; ! achtung

(defvar *p* 3)

(test '(eq 2 *p*)) ; ! achtung 

(defparameter *v* 3)

(test '(eq 3 *v*)) ; ! achtung

'(handler-case ; baustelle : faengt den folgenden fehler nicht ab
 (defvar C 3)
 (warn (x) (test 'T))
 (warning (x) (test 'T))
 (error (x) (test 'T))
 (condition (x) (test 'T))
)

(defconstant *p* 10)
;(defvar *p* 11) ; geht nicht

(test '(eq 10 *p*)) ; ! achtung 

(defconstant *v* 10)
;(defvar *v* 11) ; geht nicht

(test '(eq 10 *v*)) ; ! achtung 

; fazit : ich kann moeglichweweise durch umdefinieren von parametern und variablen den interpreter zum absturz bringen, wenn ich diese als konstanten umdefinieren und diese anderen funktionen ihrerseits eine umdefinition wollen



(print (funcall testobj 'result))

