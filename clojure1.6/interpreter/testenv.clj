
(ns testenv
)

; count, test sind bereits definiert, deswegen : Praefix te

(def teCountOk 0)
(def teCountFail 0)
(def teCountLatest  0)

; (defn teCountLatestInc [] (def teCountLatest (inc teCountLatest)))
; (defn teCountLatestInc [] (def teCountLatest (inc teCountLatest)))

(defn checkComplainAndAdjustExpected [teCount] ; test already refers to: #'clojure.core/test 
 (let [
   teCountTests (+ teCountOk teCountFail)
   teCountTestsLocal (- teCountTests teCountLatest)
  ]
  
  (def teCountLatest teCountTests)
 
  (if (= teCount teCountTestsLocal)
   nil ; alles Prima
   (println (format "Expected Test Count (from last checkpoint to here) doesn't match: teCountTestsLocal: %d teCount: %d", teCountTestsLocal, teCount))
  )
 )
)

(defn teTest [val]
 (if val
  (def teCountOk (inc teCountOk))
  (def teCountFail (inc teCountFail))
 )
)

(defn teResult []
 (format "tests: ok: %d fail: %d countLatest: %d" teCountOk teCountFail teCountLatest)
)

