(load "1.42.scm")

(define (repeated f n)
  (lambda (x)
	(if (= n 1)
	  (f x)
	  (f ((repeated f (- n 1)) x)))))
