(load "filter.scm")
(load "flatmap.scm")

(define (permutations s)
  (if (null? s)			; empty set?
	(list '())			; sequence containing empty set
	(flatmap (lambda (x)
			   (map (lambda (p) (cons x p))
					(permutations (remove x s))))
			 s)))
