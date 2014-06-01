(define (for-each f items)
  (define (iter things last-app)
	(if (null? things)
	  #t
	  (iter (cdr things) (f (car things)))))
  (iter items #f))

