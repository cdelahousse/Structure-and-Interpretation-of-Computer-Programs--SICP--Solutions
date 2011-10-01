(define (sum-of-two-largest x y z)
  (if (>= x y) 
      (sum-of-squares x (if (> y z) y z)) 
      (sum-of-squares y (if (> x z) x z))))

(define (square x) (* x x))
(define (sum-of-squares x y) 
  (+ (square x) (square y)))

;I just wanted to modify the idea above to work with unlimited arguments
(define (sum-of-list-squares . args)
  (define (square-iter l)
    (cond ((null? (cdr l)) (square (car l)))
          (else (+ (square (car l))
                   (square-iter (cdr l))))))
  (square-iter args))

;Test
(if (eq? (sum-of-list-squares 1 2 3 4 5) 55)
    (display 'YEAH)
    (display 'NAW))