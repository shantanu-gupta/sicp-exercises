(load "coercion.scm")

(define (scheme-number->scheme-number n) n)
(define (complex->complex z) z)

(put-coercion 'scheme-number 'scheme-number
			  scheme-number->scheme-number)
(put-coercion 'complex 'complex
			  complex->complex)

;; Procedures added to generic-arithmetic.scm.

;; a. Doesn't find the procedure to work on complex numbers, as expected.
;; Instead goes into infinite recursion.
;;
;; b. apply-generic works correctly now. It doesn't try to coerce to the
;; same type automatically, and if the args are of the same type, and the
;; operation exists, it would turn up earlier anyway. Otherwise the method
;; doesn't exist at all, and we can't do anything.
;;
;; c. Change added to apply-generic.scm.
