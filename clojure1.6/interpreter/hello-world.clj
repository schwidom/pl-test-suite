
(ns hello-world
 (:use testenv)
)

(checkComplainAndAdjustExpected 0)

(println "hello world")

(checkComplainAndAdjustExpected 0)

(println (teResult))

