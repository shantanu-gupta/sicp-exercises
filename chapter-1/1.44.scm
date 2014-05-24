(define dx 0.0001)

(define (smooth f)
  (lambda (x)
	(/ (+ (f (+ x dx))
		  (f x)
		  (f (- x dx)))
	   3)))

(load "1.43.scm")
(define (n-smooth f n)
  (repeated smooth n) f)
