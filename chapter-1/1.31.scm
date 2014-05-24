(define (square x) (* x x))

(define (product term a next b)
  (if (> a b)
	1
	(* (term a)
	   (product term (next a) next b))))

(define (product-iter term a next b)
  (define (iter a result)
	(if (> a b)
	  result
	  (iter (next a) (* result (term a)))))
  (iter a 1))

(define (factorial n)
  (product (lambda (x) x)
		   1
		   (lambda (x) (+ x 1))
		   n))

(define (pi last-index)
  (* 4 (product-iter (lambda (i)
					   (let ((p (* 4 i (+ i 1))))
						 (/ p (+ p 1))))
					 1
					 (lambda (x) (+ x 1))
					 last-index)))
