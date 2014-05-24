(define (square a) (* a a))
(define (expmod base exp m)
  (define (check-and-return x)
	(define (check-check-and-return y)
	  (if (= 1 y) 0 y))
	(cond 
	  ((or (= x 1) (= x (- m 1)))
	   (remainder (square x) m))
	  (check-check-and-return (remainder (square x) m))))
  (cond ((= exp 0) 1)
        ((even? exp)
		 (check-and-return (expmod base (/ exp 2) m)))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (mr-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

(define (mr-fast-prime? n times)
  (cond ((= times 0) #t)
		((even? n) (if (= n 2) #t #f))
        ((mr-test n) (mr-fast-prime? n (- times 1)))
        (else #f)))

;	TODO : Run try-it with a different number each time, and count the
;	number of failures (at least n/2).
