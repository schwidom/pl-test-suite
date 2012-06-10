
(defpackage defines-constant)
(in-package defines-constant)

(defvar *i* 0)

(defconstant +DEFINED-CONSTANT-I+ (incf *i*))


