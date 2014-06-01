(load "2.2.scm")

(define (square x) (* x x))
(define (len segment)
  (sqrt (+ (square (- (x-point (start-segment segment))
					  (x-point (end-segment segment))))
		   (square (- (y-point (start-segment segment))
					  (y-point (end-segment segment)))))))

;;	Define a rectangle in terms of its constituent line segments.
;;	Segments should be cyclic in order.
(define (make-rect s1 s2 s3 s4)
  (list s1 s2 s3 s4))	;;	TODO : orthogonality checks!
(define (first-segment rect)
  (car rect))
(define (second-segment rect)
  (cadr rect))
(define (third-segment rect)
  (caddr rect))
(define (fourth-segment rect)
  (cadddr rect))

(define (rect-len r)
  (len (first-segment r)))
(define (rect-width r)
  (len (second-segment r)))

(define (perimeter r)
  (* 2 (+ (rect-len r)
		  (rect-width r))))
(define (area r)
  (* (rect-len r) (rect-width r)))


;; Alternate representation : the lower-left point, plus the diagonal
;; segment, plus the angle that the diagonal makes with the longer side.
;; Should be enough to specify the rectangle completely.
(define (alt-make-rect low-left-point diagonal-segment theta)
  (list low-left-point diagonal-segment theta))
(define (low-left-point r)
  (car r))
(define (diagonal-segment r)
  (cadr r))
(define (theta r)
  (caddr r))
(define (alt-rec-len r)
  (* (cos theta) (len (diagonal-segment r))))
(define (alt-rec-width r)
  (* (sin theta) (len (diagonal-segment r))))
(define (alt-perimeter r)
  (* 2 (+ (alt-rec-len r)
		  (alt-rec-width r))))
(define (alt-area r)
  (* (alt-rec-len r) (alt-rec-width r)))
