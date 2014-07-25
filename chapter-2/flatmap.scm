(load "accumulate.scm")
(load "enumerate.scm")

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))
