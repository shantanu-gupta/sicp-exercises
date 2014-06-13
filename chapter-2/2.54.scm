(define (equal? a b)
  (if (eq? a b)
	#t	;;	works for empty lists as well
	(and (equal? (car a) (car b))
		 (equal? (cdr a) (cdr b)))))
