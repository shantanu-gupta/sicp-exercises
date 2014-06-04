(load "accumulate.scm")
(load "enumerate.scm")
(load "flatmap.scm")
(load "filter.scm")
  
(define (make-position row col)
    (list row col))
(define (row position) (car position))
(define (col position) (cadr position))

(define (adjoin-position row col positions)
    (append positions (list (make-position row col))))

(define (attacking? pos1 pos2)
    (define same-row? (= (row pos1) (row pos2)))
    (define same-col? (= (col pos1) (col pos2)))
    (define same-diag? (or (= (- (row pos1) (col pos1))
                              (- (row pos2) (col pos2)))
                           (= (+ (row pos1) (col pos1))
                              (+ (row pos2) (col pos2)))))
    (if (and (= (row pos1) (row pos2))
             (= (col pos1) (col pos2)))
        #f
        (or same-row? same-col? same-diag?)))

(define (nth items n)
    (if (= n 1)
        (car items)
        (nth (cdr items) (- n 1))))

(define (safe? k positions)
    (let ((kth (nth positions k)))
        (accumulate (lambda (x y) (and x y))
                    #t
                    (map (lambda (position) (not (attacking? position kth)))
                         positions))))
    
(define empty-board '())

(define (queens board-size)
  (define (queen-cols k)  
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))
