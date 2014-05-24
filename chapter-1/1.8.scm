(define (cube x) (* x x))

(define (curt-iter guess prev-guess x)
  (if (good-enough? guess prev-guess)
	guess
	(curt-iter (improve guess x)
			   guess
			   x)))

(define (improve guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess))
	 3))

(define (good-enough? guess prev-guess)
  (< (/ (abs (- guess prev-guess))
		1.0)
	 0.001))

(define (curt x)
  (curt-iter 1.0 0.0 x))
