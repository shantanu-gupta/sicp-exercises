(define (square x) (* x x))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
	guess
	(sqrt-iter (improve guess x)
			   x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(load "fixed-point.scm")
(load "average-damp.scm")
(define (new-sqrt x)
  (fixed-point (average-damp (lambda (y) (/ x y)))
			   1.0))

(load "newton.scm")
(define (sqrt-newton x)
  (newtons-method (lambda (y) (- (square y) x))
				  1.0))
