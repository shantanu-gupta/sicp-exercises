(define (make-mobile left right)
  (list left right))
(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))
(define (right-branch mobile)
  (cadr mobile))

(define (branch-length branch)
  (car branch))
(define (branch-structure branch)
  (cadr branch))

(define (total-weight mobile)
  (define (helper item)
	(if (not (pair? item))
	  item
	  (+ (total-weight (branch-structure (left-branch item)))
		 (total-weight (branch-structure (right-branch item))))))
  (helper mobile))

(define (balanced? mobile)
  (define (torque branch)
	(* (branch-length branch)
	   (total-weight (branch-structure branch))))
  (cond ((not (pair? mobile)) #t)
		(else 
		  (and (balanced? (branch-structure (left-branch mobile)))
			   (balanced? (branch-structure (right-branch mobile)))
			   (= (torque (left-branch mobile))
				  (torque (right-branch mobile)))))))

;;	(define (make-mobile left right) (cons left right))
;;	(define (make-branch length structure) (cons length structure))
;;	(define (left-branch mobile) (car mobile))
;;	(define (right-branch mobile) (cdr mobile))
;;	(define (branch-length branch) (car branch))
;;	(define (branch-structure branch (cdr branch)))
;;	The rest remains the same.
;;	So effectively, just cadr => cdr
