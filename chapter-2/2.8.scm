(load "2.7.scm")

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
				 (+ (upper-bound x) (upper-bound y))))

(define (sub-interval i1 i2)
  (make-interval (- (lower-bound i1)
					(upper-bound i2))
				 (- (upper-bound i1)
					(lower-bound i2))))
