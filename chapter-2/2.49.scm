(load "paint-primitives.scm")
(load "2.48.scm")

(define left-boundary (make-segment (make-vect 0 0)
                                    (make-vect 0 1)))
(define right-boundary (make-segment (make-vect 1 0)
                                     (make-vect 1 1)))
(define top-boundary (make-segment (make-vect 0 1)
                                   (make-vect 1 1)))
(define bottom-boundary (make-segment (make-vect 0 0)
                                      (make-vect 1 0)))

(define diagonal45 (make-segment (make-vect 0 0)
                                 (make-vect 1 1)))
(define diagonal135 (make-segment (make-vect 1 0)
                                  (make-vect 0 1)))


(define outline-painter (segments->painter (list left-boundary
                                                 top-boundary
                                                 right-boundary
                                                 bottom-boundary)))

(define x-painter (segments->painter (list diagonal45
                                           diagonal135)))

(define diamond-painter
  (let ((top-left (make-segment (make-vect 0 0.5)
                                (make-vect 0.5 1)))
        (top-right (make-segment (make-vect 0.5 1)
                                 (make-vect 1 0.5)))
        (bottom-right (make-segment (make-vect 1 0.5)
                                    (make-vect 0.5 0)))
        (bottom-left (make-segment (make-vect 0.5 0)
                                   (make-vect 0 0.5))))
    (segments->painter (list top-left
                             top-right
                             bottom-right
                             bottom-left))))

;;	TODO: wave. How to make it without seeing it work?
