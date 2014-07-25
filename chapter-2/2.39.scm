(load "2.38.scm")

(define (reverse-right-fold sequence)
  (fold-right (lambda (x y) (append y (list x)))
			  '()
			  sequence))

(define (reverse-left-fold sequence)
  (fold-left (lambda (x y) (cons y x))
			 '()
			 sequence))
