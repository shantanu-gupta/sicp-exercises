(define (square a) (* a a))

(define (square-list items)
  (if (null? items)
	'()
	(cons (square (car items)) (square-list (cdr items)))))
(define (map-square-list items)
  (map square items))
