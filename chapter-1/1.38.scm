(load "1.37.scm")

(define e (+ 2 (cont-frac-iter (lambda (i) 1.0)
							   (lambda (i)
								 (cond ((= 2 (remainder i 3))
										(* 2 (ceiling (/ i 3))))
									   (else 1)))
							   100)))
