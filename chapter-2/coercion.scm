(load "type-tags.scm")
(load "table-ops.scm")
(load "generic-arithmetic.scm")

(define (scheme-number->complex n)
  (make-complex-from-real-imag (contents n) 0))
(put-coercion 'scheme-number 'complex scheme-number->complex)
