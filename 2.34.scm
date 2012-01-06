(load "myhelpers.scm")
;Exercise 2.34

;Setup
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

;Answer

(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms) 
                (+ (* higher-terms x) this-coeff))
              0
              coefficient-sequence))

(assert (horner-eval 2 (list 1 3 0 5 0 1)) 79)

;Note: Horner's rule is cool.
;You can represent 1 + 3x + 5x^3 + x^5 as
;1x^0 + 3x^1 + 0x^2 + 5x^3 + 0x^4 + 1x^5 
;Which under Horner's rule becomes
;((((1x + 0)x + 5)x + 0)x + 3)x + 1

;Better explanations are found here:
;http://www.billthelizard.com/2011/04/sicp-234-horners-rule.html
;http://jots-jottings.blogspot.com/2011/10/sicp-exercise-234-horners-rule.html