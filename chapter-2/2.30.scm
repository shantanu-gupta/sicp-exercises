(define (square a) (* a a))

(define a (list 1
				(list 2 (list 3 4) 5)
				(list 6 7)))

(define (square-tree items)
  (cond ((null? items) items)
		((not (pair? items)) (square items))
		(else (cons (square-tree (car items)) (square-tree (cdr items))))))
(define (map-square-tree items)
  (map (lambda (x) (cond ((null? x) x)
						 ((not (pair? x)) (square x))
						 (else (map-square-tree x))))
	   items))
