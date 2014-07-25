(load "1.37.scm")

(define (tan-cf x k)
  (cont-frac-iter (lambda (i) (if (= i 1)
								x
								(- (* x x))))
				  (lambda (i) (- (* 2 i) 1))
				  k))
