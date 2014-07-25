(load "set-binary-tree.scm")

(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
	(cons '() elts)
	(let ((left-size (quotient (- n 1) 2)))
	  (let ((left-result (partial-tree elts left-size)))
		(let ((left-tree (car left-result))
			  (non-left-elts (cdr left-result))
			  (right-size (- n (+ left-size 1))))
		  (let ((this-entry (car non-left-elts))
				(right-result (partial-tree (cdr non-left-elts)
											right-size)))
			(let ((right-tree (car right-result))
				  (remaining-elts (cdr right-result)))
			  (cons (make-tree this-entry left-tree right-tree)
					remaining-elts))))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;	Take the first half of the list (or something close to that) and make a
;;	tree out of that; take the next element to be the root of the tree, and
;;	the rest of the elements and make another tree out of that. The two
;;	trees go into the left and the right branches of the tree, and we follow
;;	this plan recursively till we get to the leaves, and the work is done.
;;
;;	partial-tree:
;;	(1 3 5 7 9 11)
;;			5
;;		  /   \
;;		 1	   9
;;		  \   / \
;;		   3 7   11
;;
;;	T(n) = 2 * T(n/2) + O(1)
;;	=> T(n) = O(n)
