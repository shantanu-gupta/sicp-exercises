(load "fast-prime.scm")

(define (test-fermat-test n)
  (define (iter counter result)
	(cond ((= counter n) result)
		  ((< counter n) (if (not result)
						   #f
						   (iter (+ counter 1)
								 (= counter (expmod counter n n)))))))
  (iter 1 #t))
