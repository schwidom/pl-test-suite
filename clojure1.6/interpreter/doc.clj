

(ns doc
 (:use clojure.repl)
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

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

(def var_1 "docstring variable var_1" 1)

(teTest (= (with-out-str (doc var_1))
"-------------------------
doc/var_1
  docstring variable var_1
"
))

(checkComplainAndAdjustExpected 2)

(println (teResult))

; see also: doc.clj source.clj with-out-str.clj

