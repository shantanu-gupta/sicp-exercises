(load "fixed-point.scm")
(load "average-damp.scm")
(load "1.43.scm")

(define (log2 x) (/ (log x) (log 2)))

(define (nth-root x n)
  (fixed-point ((repeated average-damp (floor (log2 n)))
				(lambda (y) (/ x (expt y (- n 1)))))
			   1.0))
