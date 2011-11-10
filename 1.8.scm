(define (square x) (* x x))
;;;SECTION 1.1.7

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

;(define (good-enough? guess x)
;  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))


;: (sqrt 9)
;: (sqrt (+ 100 37))
;: (sqrt (+ (sqrt 2) (sqrt 3)))
;: (square (sqrt 1000))


;;EXERCISE 1.8
(define (cbrt x)
  (iter-cbrt 1.0 x))

(define (iter-cbrt guess x)
  (if (good-enough-cubed? guess x)
      guess
      (iter-cbrt (improve-cubed guess x) x)))

;This is the key!
(define (improve-cubed guess x)
  (/ (+ (/ x (square guess)) 
        (* 2 guess))
     3))
   
(define (good-enough-cubed? guess x)
  (<  (abs (- guess (improve-cubed guess x))) (/ 0.001 guess)))