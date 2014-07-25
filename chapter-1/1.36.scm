(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
	(< (abs (- v1 v2)) tolerance))
  (define (try guess)
	(display guess)
	(newline)
	(let ((next (f guess)))
	  (if (close-enough? guess next)
		next
		(try next))))
  (try first-guess))

;;	Solving x^x = 1000.
;;	Initial guess : 2.0
;;	without average-damping : 35 guesses.
;;	with average-damping : 10 guesses.
;;	Answer : around 4.5555
