(define (filtered-accumulate combiner null-value term a next b condition)
  (define (iter a result)
	(if (> a b)
	  result
	  (iter (next a) (if (condition (term a))
					   (combiner (term a) result)
					   result))))
  (iter a null-value))

(load "prime.scm")
(define (sum-primes a b)
  (filtered-accumulate +
					   0
					   (lambda (x) x)
					   a
					   (lambda (x) (+ x 1))
					   b
					   prime?))

(define (product-of-coprimes n)
  (filtered-accumulate *
					   1
					   (lambda (x) x)
					   2
					   (lambda (x) (+ x 1))
					   n
					   (lambda (x) (= 1 (gcd x n)))))
