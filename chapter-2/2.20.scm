;;	Treat rest like a usual list.
(define (same-parity a . rest)
  (define (parity n)
	(remainder n 2))
  (define (iter left so-far)
	(if (null? left)
	  so-far
	  (if (= (parity a) (parity (car left)))
		(iter (cdr left) (append so-far (list (car left))))
		(iter (cdr left) so-far))))
  (iter rest (list a)))
