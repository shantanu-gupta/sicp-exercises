(load "set-binary-tree.scm")

(define (tree->list-1 tree)
  (if (null? tree)
	'()
	(append (tree->list-1 (left-branch tree))
			(cons (entry tree)
				  (tree->list-1 (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
	(if (null? tree)
	  result-list
	  (copy-to-list (left-branch tree)
					(cons (entry tree)
						  (copy-to-list (right-branch tree)
										result-list)))))
  (copy-to-list tree '()))

(define tree1 (make-tree 7
						 (make-tree 3
									(make-tree 1 '() '())
									(make-tree 5 '() '()))
						 (make-tree 9
									'()
									(make-tree 11 '() '()))))
;	(tree->list-1 tree1)
;	= (append (tree->list-1 (3 (1 '() '()) (5 '() '())))
;			  (cons 7 (tree->list-1 (9 '() (11 '() '())))))
;	= (append (append (tree->list-1 (1 '() '()))
;					  (cons 3 (tree->list-1 (5 '() '()))))
;			  (list 7 9 11))
;	= (1 3 5 7 9 11)	recursive process.

;	(tree->list-2 tree1)
;	= (copy-to-list (3 (1 '() '()) (5 '() '()))
;					(list 7 (copy-to-list (9 '() (11 '() '()))
;										  '())))

(define tree2 (make-tree 3
						 (make-tree 1 '() '())
						 (make-tree 7
									(make-tree 5 '() '())
									(make-tree 9
											   '()
											   (make-tree 11 '() '())))))


(define tree3 (make-tree 5
						 (make-tree 3
									(make-tree 1 '() '())
									'())
						 (make-tree 9
									(make-tree 7 '() '())
									(make-tree 11 '() '()))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;	For these trees, both give the same result.
;	
;	In fact, both should give the same result for all trees (in-order
;	traversal).
;
;
;	From http://community.schemewiki.org/?sicp-ex-2.63
;	First method : O(n log n)
;	Second method : O(n). The append was costly.
