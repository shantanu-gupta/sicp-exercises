;	Recursive.
(define (f-recursive n)
  (cond ((< n 3) n)
		(else (+ (f-recursive (- n 1))
				 (* 2 (f-recursive (- n 2)))
				 (* 3 (f-recursive (- n 3)))))))

;	Iterative.
(define (f-iterative n)
  (define (iter count f1 f2 f3)
	(cond ((= count n) (+ f1
						  (* 2 f2)
						  (* 3 f3)))
		  (else (iter (+ count 1)
					  (+ f1
						 (* 2 f2)
						 (* 3 f3))
					  f1
					  f2))))
  (cond ((< n 3) n)
		(else (iter 3 2 1 0))))
