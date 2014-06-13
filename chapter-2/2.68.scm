(load "huffman.scm")
(load "2.67.scm")

(define (encode-symbol symbol tree)
  (cond ((null? tree) #f)
		((leaf? tree) (if (equal? symbol (symbol-leaf tree))
						'()
						#f))
		(else
		  (let ((left-result (encode-symbol symbol (left-branch tree))))
			(if (not left-result)
			  (let ((right-result (encode-symbol symbol (right-branch tree))))
				(if (not right-result)
				  #f
				  (cons 1 right-result)))
			  (cons 0 left-result))))))

(define (encode message tree)
  (if (null? message)
	'()
	(append (encode-symbol (car message) tree)
			(encode (cdr message) tree))))
