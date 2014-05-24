(define (square a) (* a a))

(define (fast-expt b n)
  (define (iter b n a)
	(cond ((= n 0) a)
		  ((even? n) (iter (square b) (/ n 2) a))
		  (else (iter b (- n 1) (* b a)))))
  (iter b n 1))
