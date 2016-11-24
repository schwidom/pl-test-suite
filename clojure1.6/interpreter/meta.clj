
(ns meta-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(defn f "this is the docstring" {:metainfo "this is the info"} [] 1)

(teTest (= "this is the info" (:metainfo (meta #'meta-test/f))))
(teTest (= "this is the info" (:metainfo (meta #'f))))

(teTest (= "this is the docstring" (:doc (meta #'f))))

(teTest (= '([]) (:arglists (meta #'f))))

; (teTest (= ' (:ns (meta #'f))))

(defn f2 "this is the docstring" {:metainfo "this is the info"} [ c & a ] 1) ; <- c&a advertisement

(teTest (= '([ c & a]) (:arglists (meta #'f2))))

(checkComplainAndAdjustExpected 5)

(println (teResult))

; k9r43x608g : see also meta.clj namespace.clj

