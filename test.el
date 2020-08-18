setq mylist '(1 2 3 4))

;; loop even

(dolist (element my-list) (when (= (mod element 2) 0) (print "even")) )



(let (some-var)
  (when(null some-var) (print "var is null")))
