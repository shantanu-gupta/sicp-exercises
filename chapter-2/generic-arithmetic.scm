(load "apply-generic.scm")
(define (add x y) (apply-generic 'add x y))
(define (sub x y) (apply-generic 'sub x y))
(define (mul x y) (apply-generic 'mul x y))
(define (div x y) (apply-generic 'div x y))
;; 2.79
(define (equ? x y) (apply-generic 'equ? x y))
;; 2.80
(define (=zero? x) (apply-generic '=zero? x))
;; 2.81
(define (exp x y) (apply-generic 'exp x y))

(load "type-tags.scm")
(load "table-ops.scm")
(define (install-scheme-number-package)
  (define (tag x)
	(attach-tag 'scheme-number x))
  (put 'add '(scheme-number scheme-number)
	   (lambda (x y) (tag (+ x y))))
  (put 'sub '(scheme-number scheme-number)
	   (lambda (x y) (tag (- x y))))
  (put 'mul '(scheme-number scheme-number)
	   (lambda (x y) (tag (* x y))))
  (put 'div '(scheme-number scheme-number)
	   (lambda (x y) (tag (/ x y))))
  ;; 2.79
  (put 'equ? '(scheme-number scheme-number) =)
  ;; 2.80
  (put '=zero? '(scheme-number)
	   (lambda (x) (equ? x (make-scheme-number 0))))
  ;; 2.81
  (put 'exp '(scheme-number scheme-number)
	   (lambda (x y) (tag (expt x y))))

  (put 'make 'scheme-number
	   (lambda (x) (tag x)))
  'done)

(define (make-scheme-number n)
  ((get 'make 'scheme-number) n))

(define (install-rational-package)
  ;; internal procedures
  (define (numer x) (car x))
  (define (denom x) (cdr x))
  (define (make-rat n d)
	(let ((g (gcd n d)))
	  (cons (/ n g) (/ d g))))
  (define (add-rat x y)
	(make-rat (+ (* (numer x) (denom y))
				 (* (numer y) (denom x)))
			  (* (denom x) (denom y))))
  (define (sub-rat x y)
	(make-rat (- (* (numer x) (denom y))
				 (* (numer y) (denom x)))
			  (* (denom x) (denom y))))
  (define (mul-rat x y)
	(make-rat (* (numer x) (numer y))
			  (* (denom x) (denom y))))
  (define (div-rat x y)
	(make-rat (* (numer x) (denom y))
			  (* (denom x) (numer y))))
  ;; 2.79
  (define (equ?-rat x y)
	(equ? (mul (numer x) (denom y))
		  (mul (numer y) (denom x))))

  ;; interface to rest of the system
  (define (tag x) (attach-tag 'rational x))
  (put 'add '(rational rational)
	   (lambda (x y) (tag (add-rat x y))))
  (put 'sub '(rational rational)
	   (lambda (x y) (tag (sub-rat x y))))
  (put 'mul '(rational rational)
	   (lambda (x y) (tag (mul-rat x y))))
  (put 'div '(rational rational)
	   (lambda (x y) (tag (div-rat x y))))

  ;; 2.79
  (put 'equ? '(rational rational) equ?-rat)
  ;; 2.80
  (put '=zero? '(rational)
	   (lambda (q) (= 0 (numer q))))

  (put 'make 'rational
	   (lambda (n d) (tag (make-rat n d))))
  'done)

(define (make-rational n d)
  ((get 'make 'rational) n d))

(load "complex-data-directed.scm")
(define (install-complex-package)
  ;; imported procedures from rectangular and polar packages
  (define (make-from-real-imag x y)
	((get 'make-from-real-imag 'rectangular) x y))
  (define (make-from-mag-ang r a)
	((get 'make-from-mag-ang 'polar) r a))
  ;; internal procedures
  (define (add-complex z1 z2)
	(make-from-real-imag (+ (real-part z1) (real-part z2))
						 (+ (imag-part z1) (imag-part z2))))
  (define (sub-complex z1 z2)
	(make-from-real-imag (- (real-part z1) (real-part z2))
						 (- (imag-part z1) (imag-part z2))))
  (define (mul-complex z1 z2)
	(make-from-mag-ang (* (magnitude z1) (magnitude z2))
					   (+ (angle z1) (angle z2))))
  (define (div-complex z1 z2)
	(make-from-mag-ang (/ (magnitude z1) (magnitude z2))
					   (- (angle z1) (angle z2))))
  ;; 2.79
  (define (equ?-complex z1 z2)
	(and (equ? (real-part z1) (real-part z2))
		 (equ? (imag-part z1) (imag-part z2))))
  ;; 2.80
  (define (=zero? z)
	(and (equ? (make-scheme-number 0) (real-part z))
		 (equ? (make-scheme-number 0) (imag-part z))))

  ;; interface to rest of the system
  (define (tag z) (attach-tag 'complex z))
  (put 'add '(complex complex)
	   (lambda (z1 z2) (tag (add-complex z1 z2))))
  (put 'sub '(complex complex)
	   (lambda (z1 z2) (tag (sub-complex z1 z2))))
  (put 'mul '(complex complex)
	   (lambda (z1 z2) (tag (mul-complex z1 z2))))
  (put 'div '(complex complex)
	   (lambda (z1 z2) (tag (div-complex z1 z2))))
  (put 'make-from-real-imag 'complex
	   (lambda (x y) (tag (make-from-real-imag x y))))
  (put 'make-from-mag-ang 'complex
	   (lambda (r a) (tag (make-from-mag-ang r a))))
  ;; 2.77
  (put 'real-part '(complex) real-part)
  (put 'imag-part '(complex) imag-part)
  (put 'magnitude '(complex) magnitude)
  (put 'angle '(complex) angle)
  ;; 2.79
  (put 'equ? '(complex complex) equ?-complex)
  ;; 2.80
  (put '=zero? '(complex) =zero?)
  'done)

(define (make-complex-from-real-imag x y)
  ((get 'make-from-real-imag 'complex) x y))
(define (make-complex-from-mag-ang r a)
  ((get 'make-from-mag-ang 'complex) r a))

;; Test quantities.
(install-scheme-number-package)
(install-rational-package)
(install-complex-package)
(define n1 (make-scheme-number 2))
(define n2 (make-scheme-number 4))
(define q1 (make-rational 3 4))
(define q2 (make-rational 4 5))
(define z1 (make-complex-from-real-imag 3 4))
(define z2 (make-complex-from-real-imag 5 12))
