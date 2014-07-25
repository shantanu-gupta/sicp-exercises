(load "filter.scm")
(load "flatmap.scm")
(load "enumerate.scm")

(define (triples-sum-to-s n s)
  (define (sum-to-s? triple)
	(= s (+ (car triple)
			(cadr triple)
			(caddr triple))))
  (filter sum-to-s?
		  (ordered-triples n)))

(define (ordered-triples n)
  (define (distinct? triple)
	(and (not (= (car triple) (cadr triple)))
		 (not (= (car triple) (caddr triple)))
		 (not (= (cadr triple) (caddr triple)))))
  (filter distinct?
		  (flatmap (lambda (i)
					 (flatmap (lambda (j)
								(map (lambda (k) (list i j k))
									 (enumerate-interval 1 n)))
							  (enumerate-interval 1 n)))
				   (enumerate-interval 1 n))))
