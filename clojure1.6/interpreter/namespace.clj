
(ns namespace-test
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(teTest (= "namespace-test" (namespace ::a)))
(teTest (= "user" (namespace :user/a)))

(teTest (= nil (namespace :a)))
(teTest (= nil (namespace 'a)))

(checkComplainAndAdjustExpected 4)

(println (teResult))

; k9r43x608g : see also meta.clj namespace.clj

