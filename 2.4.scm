(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))


;Answer
(define (cdr z)
  (z (lambda (p q) q)))

;Test
(define buzz (cons 9 40))
(car buzz)
(cdr buzz)