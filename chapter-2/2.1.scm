(load "rat.scm")

(define (new-make-rat n d)
  (if (or (and (positive? n) (negative? d))
		  (and (negative? n) (positive? d)))
	(make-rat (- (abs n))
			  (abs d))
	(make-rat (abs n)
			  (abs d))))
