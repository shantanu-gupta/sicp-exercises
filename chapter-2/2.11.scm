(define (mul-interval x y)
  (let ((l1 (lower-bound x))
		(l2 (lower-bound y))
		(u1 (upper-bound x))
		(u2 (upper-bound y)))
	(cond

	  ((and (negative? l1) (negative? u1)
			(negative? l2) (negative? u2))
	   (make-interval (* u1 u2) (* l1 l2)))		;	-5 -3 * -6 -4 = 12 30

	  ((and (negative? l1) (negative? u1)
			(negative? l2) (positive? u2))
	   (make-interval (* l1 u2) (* l1 l2)))		;	-5 -3 * -6 4 = -20 30

	  ((and (negative? l1) (negative? u1)
			(positive? l2) (positive? u2))
	   (make-interval (* l1 u2) (* u1 l2)))		;	-5 -3 * 4 6 = -30 -12

	  ((and (negative? l1) (positive? u1)
			(negative? l2) (negative? u2))
	   (make-interval (* u1 l2) (* l1 u1)))		;	-5 3 * -6 -4 = -18 30

	  ((and (negative? l1) (positive? u1)
			(negative? l2) (positive? u2))
	   (make-interval (min (* l1 u2) (* u1 l2))		;	-5 3 * -6 4 = -20 30
					  (max (* l1 l2) (* u1 u2))))

	  ((and (negative? l1) (positive? u1)
			(positive? l2) (positive? u2))
	   (make-interval (* l1 u2) (* u1 u2)))		;	-5 3 * 4 6 = -30 18

	  ((and (positive? l1) (positive? u1)
			(negative? l2) (negative? u2))
	   (make-interval (* u1 l2) (* l1 u2)))		;	3 5 * -6 -4 = -30 -12

	  ((and (positive? l1) (positive? u1)
			(negative? l2) (positive? u2))
	   (make-interval (* u1 l2) (* u1 u2)))		;	3 5 * -6 4 = -30 20

	  (else
	   (make-interval (* l1 l2) (* u1 u2))))))	;	3 5 * 4 6 = 12 30
