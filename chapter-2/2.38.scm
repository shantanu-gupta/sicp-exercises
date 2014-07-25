(load "accumulate.scm")

(define fold-right accumulate)
(define (fold-left op initial sequence)
  (define (iter result rest)
	(if (null? rest)
	  result
	  (iter (op result (car rest))
			(cdr rest))))
  (iter initial sequence))

;;	1.5
;;	0.16666
;;	(1 (2 (3 ())))
;;	(((() 1) 2) 3)
