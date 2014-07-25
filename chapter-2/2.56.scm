(load "differentation.scm")

(define (make-exponentiation base exponent)
  (cond ((= exponent 0) 1)
		((= exponent 1) base)
		(else (list '** base exponent))))

(define (base exponentiation) (cadr exponentiation))
(define (exponent exponentiation) (caddr exponentiation))
(define (exponentiation? x) (and (pair? x) (eq? (car x) '**)))

(define (deriv exp var)
  (cond ((number? exp) 0)
		((variable? exp)
		 (if (same-variable? exp var) 1 0))
		((sum? exp)
		 (make-sum (deriv (addend exp) var)
				   (deriv (augend exp) var)))
		((product? exp)
		 (make-sum
		   (make-product (multiplier exp)
						 (deriv (multiplicand exp) var))
		   (make-product (deriv (multiplier exp) var)
						 (multiplicand exp))))
		((exponentiation? exp)
		 (let ((u (base exp))
			   (n (exponent exp)))
		   (make-product (make-product n
									   (make-exponentiation u (- n 1)))
						 (deriv u var))))
		(else
		  (error "unknown expression type -- DERIV" exp))))
