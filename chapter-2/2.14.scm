(load "2.7.scm")
(load "2.8.scm")
(load "2.10.scm")
(load "2.12.scm")

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
				(add-interval r1 r2)))
(define (par2 r1 r2)
  (let ((one (make-interval 1 1))) 
	(div-interval one
				  (add-interval (div-interval one r1)
								(div-interval one r2)))))

(define a (div-interval (make-center-percent 1000 1)
						(make-center-percent 1000 1)))
(define b (div-interval (make-center-percent 1000 1)
						(make-center-percent 100 1)))

;	a = 1 +- 2%
;	b = 10 +- 2%
(define c (par1 a b))	;	6 percent error
(define d (par2 a b))	;	2 percent error
