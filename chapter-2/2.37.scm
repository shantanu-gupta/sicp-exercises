(load "accumulate.scm")
(load "2.36.scm")	;;	accumulate-n

(define M (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (row) (dot-product row v)) m))

(define (transpose mat)
  (accumulate-n cons '() mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
	(map (lambda (m-row)
		   (map (lambda (n-col)
				  (dot-product n-col m-row))
				cols))
		 m)))
