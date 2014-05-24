(define (double a) (+ a a))
(define (halve a) (/ a 2))

(define (* a b)
  (cond ((= b 0) 0)
		((= b 1) a)
		((even? b) (* (double a) (halve b)))
		(else (+ a (* a (- b 1))))))
