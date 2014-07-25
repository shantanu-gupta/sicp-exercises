(define (cont-frac n d k)
  (define (f i)
	(if (> i k)
	  0
	  (/ (n i)
		 (+ (d i) (f (+ i 1))))))
  (f 1))

(define (cont-frac-iter n d k)
  (define (iter i result)
	(if (= i 0)
	  result
	  (iter (- i 1) (/ (n i)
					   (+ (d i) result)))))
  (iter k 0))

;;	4 decimal places correct with a depth of 12.
