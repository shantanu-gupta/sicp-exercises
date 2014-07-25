(load "differentation.scm")

(define (upto x items)
  (define (iter so-far left)
	(if (or (null? left) (equal? x (car left)))
	  so-far
	  (iter (append so-far (list (car left)))
			(cdr left))))
  (let ((upto-x (iter '() items)))
	(if (null? (cdr upto-x))	;	just 1 term up to x, needs to be unwrapped.
	  (car upto-x)
	  upto-x)))

; + is somewhere in the main expression
(define (sum? x) (and (pair? x) (memq '+ x)))

;;	Left-associative addition/multiplication.
;;	Take the minimum terms possible from the left.
;;	Hence the upto => memq.
(define (addend sum) (upto '+ sum))
(define (augend sum) 
  (let ((r-end (cdr (memq '+ sum))))
	(if (null? (cdr r-end))
	  (car r-end)
	  r-end)))

; * has precedence, so remains the same.
(define (product? x) (and (pair? x) (eq? (cadr x) '*)))
(define (multiplier p) (car p))
(define (multiplicand p) (caddr p))

;;	Constructors don't have to change...
(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
		((=number? a2 0) a1)
		((and (number? a1) (number? a2)) (+ a1 a2))
		(else (list a1 '+ a2))))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
		((=number? m1 1) m2)
		((=number? m2 1) m1)
		((and (number? m1) (number? m2)) (* m1 m2))
		(else (list m1 '* m2))))
