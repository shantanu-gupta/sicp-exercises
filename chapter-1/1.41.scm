(define (double f)	;;	f takes one argument only
  (lambda (x)
	(f (f x))))

;	(((double (double double)) inc) 5) = 21
;	16x increment.
