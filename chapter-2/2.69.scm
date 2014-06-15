(load "huffman.scm")

(define sample-pairs '((A 4) (B 2) (C 1) (D 1)))
(define sample-pairs2 '((A 4) (B 2) (C 1)))
(define sample-pairs3 '((A 4) (B 2)))
(define sample-pairs4 '((A 4)))

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

;; Made this more succinct using
;;		http://community.schemewiki.org/?sicp-ex-2.69
(define (successive-merge leaf-set)
  (if (null? (cdr leaf-set))
	(car leaf-set)
	(successive-merge (adjoin-set (make-code-tree (car leaf-set)
												  (cadr leaf-set))
								  (cddr leaf-set)))))
