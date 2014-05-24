(define (square a) (* a a))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (next x)
(if (= x 2)
	3
	(+ x 2)))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
		((divides? test-divisor n) test-divisor)
		(else (find-divisor n (next test-divisor)))))
(define (divides? a b)
  (= (remainder b a) 0))
(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (get-internal-run-time)))
(define (start-prime-test n start-time)
  (if (prime? n)
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
					  (multiple-search-for-primes (* factor low) high width factor))))
