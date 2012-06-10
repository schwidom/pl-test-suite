#!/usr/bin/clisp

(load "testenv.cl")

(asdf:operate 'asdf:load-op 'clsql-sqlite3)

(do-all-symbols (a) (print a))

; (print (funcall testobj 'result))
