(load "huffman.scm")
(load "2.69.scm")

;;	OLD stuff. Only kept here because loading the unordered-list
;;	representation overrides adjoin-set and makes everything not work.
(define (element-of-set? x unordered-set)
  (if (null? unordered-set)
	#f
	(or (equal? x (car unordered-set))
		(element-of-set? x (cdr unordered-set)))))

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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define rock-symbols '((A 2) (Get 2)
					   (Na 16) (Yip 9)
					   (Boom 1) (Job 2)
					   (Sha 3) (Wah 1)))
(define rock-tree (generate-huffman-tree rock-symbols))
(define rock-message '(Get a job
						Sha na na na na na na na na
						Get a job
						Sha na na na na na na na na
						Wah yip yip yip yip yip yip yip yip yip
						Sha boom))
(define rock-encoded (encode rock-message rock-tree))

;;	(length rock-encoded) = 84
;;	(length rock-message) = 36 ==> 108 bits for fixed-length codes.
;;	Save 24 / 108 = 22% savings.
