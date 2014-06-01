;	To test
(define a (list 1))
(define b (list 1 2))
(define c (list (list 1 2) (list 3 4)))

(define (fringe tree)
  (cond ((null? tree) tree)
		((not (pair? tree)) (list tree))
		(else (append (fringe (car tree))
					  (fringe (cdr tree))))))
