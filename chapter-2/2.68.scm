(load "huffman.scm")
(load "2.67.scm")
(load "set-unordered-list.scm")

(define sample-symbols (decode sample-message sample-tree))

(define (encode-symbol symbol tree)
  (define helper
	(cond ((null? tree) #f)
		  ((leaf? tree) (if (equal? symbol (symbol-leaf tree))
						  '()
						  #f))
		  (else
			(if (element-of-set? symbol (symbols (left-branch tree)))
			  (cons 0 (encode-symbol symbol (left-branch tree)))
			  (if (element-of-set? symbol (symbols (right-branch tree)))
				(cons 1 (encode-symbol symbol (right-branch tree)))
				#f)))))
  (if (not helper)
	(error "ERROR: Unknown symbol! -- ENCODE-SYMBOL" symbol)
	helper))

(define (encode message tree)
  (if (null? message)
	'()
	(append (encode-symbol (car message) tree)
			(encode (cdr message) tree))))
