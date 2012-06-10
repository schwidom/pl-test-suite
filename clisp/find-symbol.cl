#!/usr/bin/clisp

(require "testenv2.cl")

(defpackage current-test 
 (:import-from testenv2 test testobj result)
 (:import-from ext letf)
)

(in-package current-test)

(test '(functionp (symbol-function 'find-symbol)))
(test '(functionp (symbol-function 'find-package)))
(test '(functionp (symbol-function 'export)))

(test '(eq 'abc (find-symbol "ABC")))
(test '(not (eq 'abc (find-symbol "abc"))))

(test '(eq NIL (find-symbol "DEF")))

(null 'def)

(test '(not (eq NIL (find-symbol "DEF"))))

(test '(eq NIL (find-symbol "GHI")))

(intern "GHI")

(test '(not (eq NIL (find-symbol "GHI"))))

(test '(not (eq (make-symbol "A") (make-symbol "A"))))

(let* ((s (gentemp)) (sn (symbol-name s)))
 (test '(not (eq s (make-symbol sn))))
 (test '(eq s (find-symbol sn)))
)

(letf (((values sym inf) (find-symbol "ED" (find-package "COMMON-LISP"))))
 (test '(eq 'ed sym))
 (test '(eq :EXTERNAL inf))
)

(letf (((values sym inf) (find-symbol "ED" *package*)))
 (test '(eq 'ed sym))
 (test '(eq :INHERITED inf))
)

(test '(eq NIL (find-symbol "A")))

'a

(letf (((values sym inf) (find-symbol "A" *package*)))
 (test '(eq 'a sym))
 (test '(eq :INTERNAL inf))
)

(export 'a)

(letf (((values sym inf) (find-symbol "A" *package*)))
 (test '(eq 'a sym))
 (test '(eq :EXTERNAL inf))
)

(unexport 'a)

(letf (((values sym inf) (find-symbol "A" *package*)))
 (test '(eq 'a sym))
 (test '(eq :INTERNAL inf))
)


;(test '(eq NIL (find-symbol "A" (find-package "KEYWORD")))) ; bereits anderweitig defniert, resultiert nicht aus 'A

(test '(eq NIL (find-symbol "B" (find-package "KEYWORD")))) 
(test '(eq NIL (find-symbol "B" (find-package *package*))))

:B

(letf (((values sym inf) (find-symbol "B" "KEYWORD")))
 (test '(keywordp sym))
 (test '(eq :b sym))
 (test '(eq :EXTERNAL inf))
)

(test '(eq NIL (find-symbol "B" (find-package *package*))))

; see also export.cl find-package.cl find-symbol.cl gensym.cl gentemp.cl intern.cl make-symbol.cl 


(print (funcall testobj 'result))

