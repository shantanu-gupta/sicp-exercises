;	TODO

(define (iterative-improve good-enough? improve-guess)
  (lambda (guess)
	(if (good-enough? guess)
	  guess
	  ((iterative-improve good-enough? improve-guess)
	   (improve-guess guess)))))


(load "average-damp.scm")
(define (square x) (* x x))
(define (close-enough? a b)
  (< (abs (- a b)) 0.00001))
(define (sqrt x)
  ((iterative-improve (lambda (y) (close-enough? x (square y)))
					  (average-damp (lambda (y) (/ x y))))
   1.0))

(define (fixed-point f first-guess)
  ((iterative-improve (lambda (x) (close-enough? x (f x)))
					  f)
   first-guess))
