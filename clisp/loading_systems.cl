#!/usr/bin/clisp

(require "testenv2.cl")

(defpackage current-test 
 (:import-from testenv2 test testobj result)
)

(in-package current-test)

(print asdf:*central-registry*)
(print "die gelatenen module sind im dem Pfad asdf:*central-registry* zu finden und enden auf .asd")
'(asdf:operate 'asdf:load-op 'clsql-sqlite3)
'(asdf:operate 'asdf:load-op 'aspectl)
(asdf:operate 'asdf:load-op 'closer-mop)


(print (funcall testobj 'result))
