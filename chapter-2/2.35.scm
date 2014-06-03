(load "accumulate.scm")

(define test (list 1 (list 2 3 (list 4 5)) 6))

;;	Quite dirty, isn't it!
;;
;;	(define (count-leaves t)
;;	  (accumulate (lambda (x y) (+ y (if (not (pair? x))
;;									   1
;;									   (count-leaves x))))
;;				  0
;;				  (map (lambda (x) x)
;;					   t)))

;;	Something cleaner I found here : 
;;	http://www.billthelizard.com/2011/04/sicp-235-counting-leaves-of-tree.html
(define (enumerate-tree tree)	;;	fringe from 2.28!
  (cond ((null? tree) '())
		((not (pair? tree)) (list tree))
		(else (append (enumerate-tree (car tree))
					  (enumerate-tree (cdr tree))))))
(define (count-leaves t)
  (accumulate +
			  0
			  (map (lambda (x) 1)
				   (enumerate-tree t))))
