(load "2.46.scm")	;;	vectors, not needed as such, but good to have!

(define (make-segment v1 v2)
  (cons v1 v2))
(define (start-segment segment) (car segment))
(define (end-segment segment) (cdr segment))
