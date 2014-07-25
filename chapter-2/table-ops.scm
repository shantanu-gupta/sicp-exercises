;;	An implementation of put and get, used in many exercises here.
;;	Taken from:
;;		eli.thegreenplace.net/2007/09/09/sicp-section-24

(define *op-table* (make-hash-table))
(define (put op type proc)
  (hash-table/put! *op-table* (list op type) proc))
(define (get op type)
  (hash-table/get *op-table* (list op type) #f))

(define *coercion-table* (make-hash-table))
(define (put-coercion type-from type-to proc)
  (hash-table/put! *coercion-table* (list type-from type-to) proc))
(define (get-coercion type-from type-to)
  (hash-table/get *coercion-table* (list type-from type-to) #f))
