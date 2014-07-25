;;	OLD.
;;	(define (deriv exp var)
;;	  (cond ((number? exp) 0)
;;			((variable? exp) (if (same-variable? exp var) 1 0))
;;			((sum? exp)
;;			 (make-sum (deriv (addend exp) var)
;;					   (deriv (augend exp) var)))
;;			((product? exp)
;;			 (make-sum
;;			   (make-product (multiplier exp)
;;							 (deriv (multiplicand exp) var))
;;			   (make-product (deriv (multiplier exp) var)
;;							 (multiplicand exp))))
;;			<more rules can be added here>
;;			(else (error "unknown expression type -- DERIV" exp))))

(define (variable? x) (symbol? x))
(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (deriv exp var)
  (cond ((number? exp) 0)
		((variable? exp) (if (same-variable? exp var) 1 0))
		(else ((get 'deriv (operator exp)) (operands exp)
										   var))))
(define (operator exp) (car exp))
(define (operands exp) (cdr exp))

;;	a. 	Expressions are classified as either sums or products, which become
;;	their type. number? and variable? are retained because we can't apply
;;	operator and operands to those terms directly. But what if we define an
;;	identity operator and make the number/variable an operand for that
;;	operator? What happens then? I would guess that would make the whole
;;	thing work... May need 2 different kinds of identity for variables and
;;	numbers.
;;
;;	b, c. 
(load "table-ops.scm")	; for put and get.
(define (install-deriv-package)
  ;; internal procedures
  ;; Removed a 'd' from all the ca(d*)rs because of
  ;;	eli.thegreenplace.net/2007/09/09/sicp-section-24/
  ;;	The operator is stripped out earlier, so there's one less element at
  ;;	the head.
  (define (addend s) (car s))
  (define (augend s) (cadr s))
  (define (multiplier p) (car p))
  (define (multiplicand p) (cadr p))
  (define (base exponentiation) (car exponentiation))
  (define (exponent exponentiation) (cadr exponentiation))

  (define (make-sum a1 a2)
	(cond ((=number? a1 0) a2)
		  ((=number? a2 0) a1)
		  ((and (number? a1) (number? a2)) (+ a1 a2))
		  (else (list '+ a1 a2))))
  (define (make-product m1 m2)
	(cond ((or (=number? m1 0) (=number? m2 0)) 0)
		  ((=number? m1 1) m2)
		  ((=number? m2 1) m1)
		  ((and (number? m1) (number? m2)) (* m1 m2))
		  (else (list '* m1 m2))))
  (define (make-exponentiation base exponent)
	(cond ((= exponent 0) 1)
		  ((= exponent 1) base)
		  (else (list '** base exponent))))

  (define (sum-deriv exp var)
	(make-sum (deriv (addend exp) var)
			  (deriv (augend exp) var)))
  (define (product-deriv exp var)
	(make-sum
	  (make-product (multiplier exp)
					(deriv (multiplicand exp) var))
	  (make-product (deriv (multiplier exp) var)
					(multiplicand exp))))
  (define (exponent-deriv exp var)
	(let ((u (base exp))
		  (n (exponent exp)))
	  (make-product (make-product n
								  (make-exponentiation u (- n 1)))
					(deriv u var))))

  ;; interface to the rest of the system
  (put 'deriv '+ sum-deriv)
  (put 'deriv '* product-deriv)
  (put 'deriv '** exponent-deriv)
  'done)

;;	d.	Change the order of the arguments supplied to put at the end of the
;;	procedure.
