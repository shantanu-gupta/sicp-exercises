(load "fast-prime.scm")

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (get-internal-run-time)))
(define (start-prime-test n start-time)
  (if (fast-prime? n 100)		;	100 is arbitrary.
	(report-prime (- (get-internal-run-time) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display (/ elapsed-time internal-time-units-per-second)))

(define (search-for-primes low high)
  (if (even? low)
	(search-for-primes (+ low 1) high)
	(cond ((< low high) (timed-prime-test low)
						(search-for-primes (+ low 2) high)))))

(define (multiple-search-for-primes low high width factor)
  (cond ((< low high) (search-for-primes low (+ low width))
					  (newline)
					  (multiple-search-for-primes (* factor low)
												  high
												  width
												  factor))))
