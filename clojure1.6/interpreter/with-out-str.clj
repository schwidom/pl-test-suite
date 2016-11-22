

(ns with-out-str-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (= "hello world 1\n" (with-out-str (println "hello world 1"))))

(teTest (= "hello world 2\n" (with-out-str (printf "%s\n" "hello world 2"))))

(teTest (= "hello world 3" (with-out-str (printf "%s" "hello world 3"))))

(checkComplainAndAdjustExpected 3)

(println (teResult))

; h9o7bq5hnc ; see also: doc.clj source.clj with-out-str.clj

