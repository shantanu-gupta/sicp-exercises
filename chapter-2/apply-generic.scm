(load "type-tags.scm")
(load "table-ops.scm")
(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
	(let ((proc (get op type-tags)))
	  (if proc
		(apply proc (map contents args))
		(if (= (length args) 2)
		  (let ((type1 (car type-tags))
				(type2 (cadr type-tags))
				(a1 (car args))
				(a2 (cadr args)))
			;; 2.81
			(if (equal? type1 type2)
			  (error "No method for these types -- APPLY-GENERIC"
					 (list type1 type2))
			  (let ((t1->t2 (get-coercion type1 type2))
					(t2->t1 (get-coercion type2 type1)))
				(cond (t1->t2
						(apply-generic op (t1->t2 a1) a2))
					  (t2->t1
						(apply-generic op a1 (t2->t1 a2)))
					  (else
						(error "No method for these types"
							   (list op type-tags))))))
			(error "No method for these types -- APPLY-GENERIC"
				   (list op type-tags))))
		;; 2.82
		;; Coerce all arguments to the type of the first argument, then the
		;; second, then the third, and so on.
		;; To do this:
		;; 	First get the coercion procedures for converting to the given
		;; 	type, if they exist.
		;;	Then try to get a procedure for the coerced types, if _that_
		;;	exists.
		(let (coercions (filter non-false (map (lambda (arg)

(define (non-false items)
  (if (null? items)
	#t
	(and (car items) (non-false (cdr items)))))
