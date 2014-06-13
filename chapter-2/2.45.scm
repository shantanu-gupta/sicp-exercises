(define (split relation1 relation2)
  (lambda (painter n)
    (if (= n 0)
        painter
        (let ((smaller ((split relation1 relation2) painter (- n 1))))
          (relation1 painter (relation2 smaller smaller))))))

(define right-split (split beside below))
(define up-split (split below beside))
