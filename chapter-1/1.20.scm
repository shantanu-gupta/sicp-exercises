;; (gcd 206 40)
;; 
;; 	Applicative order
;; 	= (gcd 40 (remainder 206 40))
;; 	= (gcd 40 6)
;; 	= (gcd 6 (remainder 40 6))
;; 	= (gcd 6 4)
;; 	= (gcd 4 (remainder 6 4))
;; 	= (gcd 4 2)
;; 	= (gcd 2 (remainder 4 2))
;; 	= (gcd 2 0)
;; 	= 2
;; 
;; 	Normal order
;; (gcd 206 40)
;; = (if (= 40 0)
;; 	206
;; 	(gcd 40 (remainder 206 40)))
;; = (gcd 40 (remainder 206 40))
;; = (if (= 0 (remainder 206 40))	;	rem #1
;; 	40
;; 	(gcd (remainder 206 40) (remainder 40 (remainder 206 40))))
;; 
;; = (gcd (remainder 206 40)
;; 	   (remainder 40 (remainder 206 40)))
;; = (if (= 0 (remainder 40 (remainder 206 40)))	; rem #2,3
;; 	(remainder 206 40)
;; 	(gcd (remainder 40 (remainder 206 40))
;; 		 (remainder (remainder 206 40)
;; 					(remainder 40 (remainder 206 40)))))
;; 
;; = (gcd (remainder 40 (remainder 206 40))
;; 	   (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
;; = (if (= 0 (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) ;	rem #4,5,6,7
;; 	(remainder 40 (remainder 206 40))
;; 	(gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;; 		 (remainder (remainder 40 (remainder 206 40))
;; 					(remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))
;; 
;; = ... something with 7 remainders in the if check.
;;	Then 4 more in the actual answer.
