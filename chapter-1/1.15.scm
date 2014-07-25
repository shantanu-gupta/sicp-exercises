(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
  (display angle)
  (newline)
  (if (not (> (abs angle) 0.1))
	angle
	(p (sine (/ angle 3.0)))))

;;	12.15 - 5 times.
;;	logarithmic complexity (time and space).
