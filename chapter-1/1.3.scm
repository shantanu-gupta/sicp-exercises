(define (square a) (* a a))

(define (sum-of-squares a b)
  (+ (square a) (square b)))

(define (sum-of-squares-two-larger a b c)
  (if (< a b)
	(sum-of-squares b c)
	(if (< b c)
	  (sum-of-squares a c)
	  (sum-of-squares a b))))
