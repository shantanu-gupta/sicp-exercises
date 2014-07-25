(load "sum.scm")
(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
	 dx))

(define (simpson-integral f a b n)
  (define h (/ (- b a) n))	;;	n is even.
  (define (add-two-h x) (+ x (* 2 h)))
  (* (/ h 3) (+ (f a) (f b)
				(* 4 (sum f (+ a h) add-two-h b))
				(* 2 (sum f (+ a (* 2 h)) add-two-h b)))))
