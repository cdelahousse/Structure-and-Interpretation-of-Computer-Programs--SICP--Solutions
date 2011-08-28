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


;;EXERCISE 1.7
(define (good-enough? guess x)
  (<  (abs (- guess (improve guess x))) (/ 0.001 guess)))

;For small numbers, when the guess approaches the tolerance, good-enough will return true despite the guess being really bad for that small number. 

;For big number, ... no idea. Javascript has a hard time computer floating poing numbers as well, so I imagine it has something to do with binary math. I've really got NO idea, despite reading up on solutions.

;The proposed solution for good enough is great because it looks at the change between two guesses. If that change is smaller than a fraction (or small percentage, or small proportion) of the guess, it stops. The new "tolerance" is a fraction of the guess, that means it gets evaluated anew with every iteration. The tolerance is no longer calculated in terms of the radicand.

;NOTE: I used (improve guess x) in good enough. I used it cause I'm lazy. It's possible to reformulate everything to save the extra evaluation of (improve guess x). I just didn't feel like it. This guy has a better answer: 
;  http://www.billthelizard.com/2009/10/sicp-exercises-16-18.html

;TODO: Learn floating point binary math.
;http://www.dummies.com/how-to/content/the-real-difference-between-integers-and-floatingp.html
;http://kipirvine.com/asm/workbook/floating_tut.htm