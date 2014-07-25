(load "set-unordered-list.scm")

(define (union-set set1 set2)
  (define (iter added-so-far left)
	(if (null? left)
	  added-so-far
	  (iter (if (element-of-set? (car left) added-so-far)
			  added-so-far
			  (cons (car left) added-so-far))
			(cdr left))))
  (iter '() (append set1 set2)))
