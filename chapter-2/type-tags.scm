(define (attach-tag type-tag contents)
  ;; 2.78
  (if (number? contents)
	contents
	(cons type-tag contents)))

(define (type-tag datum)
  (if (pair? datum)
	(car datum)
	;; 2.78
	(if (number? datum)
	  'scheme-number
	  (error "Bad tagged datum -- TYPE-TAG" datum))))

(define (contents datum)
  (if (pair? datum)
	(cdr datum)
	;; 2.78
	(if (number? datum)
	  datum
	  (error "Bad tagged datum -- CONTENTS" datum))))

(define (rectangular? z)
  (eq? (type-tag z) 'rectangular))
(define (polar? z)
  (eq? (type-tag z) 'polar))
