

(ns doc
 (:use clojure.repl)
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(def var_1 "docstring variable var_1" 1)

(teTest (= (with-out-str (doc var_1))
"-------------------------
doc/var_1
  docstring variable var_1
"
))


(defn f1 "docstring function f1" 
 {} ; tags
 ([] nil)
)

(teTest (= (with-out-str (doc f1)) 
"-------------------------
doc/f1
([])
  docstring function f1
"))


(defmacro m1 "docstring macro f1" [])

(teTest (= (with-out-str (doc m1)) 
"-------------------------
doc/m1
([])
Macro
  docstring macro f1
"))


(checkComplainAndAdjustExpected 3)

(println (teResult))

; see also: doc.clj source.clj with-out-str.clj

