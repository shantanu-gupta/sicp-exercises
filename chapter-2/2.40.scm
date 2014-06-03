(load "enumerate.scm")
(load "accumulate.scm")
(load "prime-sum.scm")
(load "flatmap.scm")

(define (unique-pairs n)
  (flatmap (lambda (i) (map (lambda (j) (list i j))
							(enumerate-interval 1 (- i 1))))
		   (enumerate-interval 1 n)))

(define (new-prime-sum-pairs n)
  (map make-pair-sum
	   (filter prime-sum? (unique-pairs n))))
