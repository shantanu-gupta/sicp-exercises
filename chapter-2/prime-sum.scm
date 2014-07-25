(load "accumulate.scm")
(load "enumerate.scm")
(load "../chapter-1/prime.scm")
(load "filter.scm")
(load "flatmap.scm")

(define (pairs n)
  (accumulate append
			  '()
			  (map (lambda (i)
					 (map (lambda (j) (list i j))
						  (enumerate-interval 1 (- i 1))))
				   (enumerate-interval 1 n))))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (map make-pair-sum
	   (filter prime-sum?
			   (flatmap
				 (lambda (i)
				   (map (lambda (j) (list i j))
						(enumerate-interval 1 (- i 1))))
				 (enumerate-interval 1 n)))))
