(load "2.46.scm")
(load "2.47.scm")

(define (frame-coord-map frame)
  (lambda (v)
	(add-vect
	  (origin-frame frame)
	  (add-vect (scale-vect (xcor-vect v)
							(edge1-frame frame))
				(scale-vect (ycor-vect v)
							(edge2-frame frame))))))
