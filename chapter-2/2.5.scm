(define (cons a b)
  (* (expt 2 a)
	 (expt 3 b)))

(define (divides? a b)
  (= 0 (remainder a b)))
(define (num-divisions n i)
  (cond ((not (divides? n i)) 0)
		(else (+ 1 (num-divisions (/ n i) i)))))

(define (car a)
  (num-divisions a 2))
(define (cdr a)
  (num-divisions a 3))
