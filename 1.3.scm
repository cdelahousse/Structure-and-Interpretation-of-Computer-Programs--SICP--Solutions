(define (sum-of-two-largest x y z)
  (if (>= x y) 
      (sum-of-squares x (if (> y z) y z)) 
      (sum-of-squares y (if (> x z) x z))))

(define (square x) (* x x))
(define (sum-of-squares x y) 
  (+ (square x) (square y)))
