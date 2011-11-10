(define nl newline)
(define dsp display)

;Exercise 2.6
(define zero (lambda (f) (lambda (x) x)))
(define add-1 (lambda (n) (lambda (f) (lambda (x) (f ((n f) x)))))) ;I wrote this through induction... BUT FUUUUUUUUHHKKK... WTF.. I still don't understand it. So let's play around with it abit

;Discussion:
;I think the trick to figuring out lambdas, lambda calculus and Church Numerals the following.
;1. At any stage, note what functions are passed as arguments, which ones are evaluated  and which ones aren't evaluated.
;2. Keep in mind what every stage or function returns


;Test and playing
(display "Initial tests\n")

;Defining zero, so x -> x 
(define blah zero) ;!!_!! REMEMBER: the cn zero must not be evaluated.
 ; adding one to zero, creating church numeral 1, lambda fx -> f(x)
(define cn-one (add-1 blah))
;Higher order (CN representing ONE) function that takes a function
cn-one 
 ;adding a function to church numeral one
(define one-w-function (cn-one inc))
 ;CN one with function INC. 
one-w-function

;Inc is just a test function it increments every number

;Evaluating with x the churchnumeral one that returned a fucntion
(one-w-function 0) ; ->(inc 0)
(one-w-function 1) ; ->(inc 1)
(display "Equivalents\n")
;These two are equivalent to:
(((add-1 zero) inc) 0)
(((add-1 zero) inc) 1)

;MODELING VIA SUBSTITUTION!
;Church Numeral ONE!
;(add-1 zero)
;(lambda (f) (lambda (x) (f ((zero f) x))))
;(lambda (f) (lambda (x) (f ((lambda (f) (lambda (x) (x))) x))))
;(lambda (f) (lambda (x) (f ((lambda(x) (x))))))
;(lambda (f) (lambda (x) (f x)))
;Therefore:
(define cn-one (lambda (f) (lambda (x) (f x))))

;Test
(dsp "Direct CN one")
(nl)
(define one-w-func (cn-one inc))
(one-w-func 0) ; -> (inc 0)
(one-w-func 1) ; -> (inc 1)
(one-w-func 2) ; -> (inc 2)

;Church Numeral two!
(define cn-two (lambda (f) (lambda (x) (f (f x)))))

;test
(dsp "direct CN two")
(nl)
(define two-w-function (cn-two inc))
(two-w-function 0) ; -> (inc (inc 0)
(two-w-function 1) ;  -> (inc (inc 1)

;Make Church Numerals
(define (make-cn n)
    (if (= 0 n)
        zero
        (add-1 (make-cn (dec n)))))
;Test
(dsp "Make CN")
(nl)
(make-cn 5)
(define cn-five (make-cn 5)) ;Five
((cn-five inc) 0)
((cn-five inc) 1)

;To add to my discussion at up top:
;Think of what's return to help think about CN's:
;A. This function (A) take two church numerals and returns a function (B)
;B. This function (B) takes any function (ex: Z, inc, f, or anything..) 
; and returns a function (C) 
;C. Takes a an argument (X) and applies the Z function to x a number of ChurchNumeralNumber times
(define add-church
  (lambda (n m)
    (lambda (f)
      (lambda (x)
        ((n f) ((m f) x))))))
;In this, (m f) evaluates to return a function that contains a function (f.. or in our case, it will be inc). ((m f) x) takes the previous function, applies x and returns (in our case using inc) a number. (n f) evaluates like (m f) but takes the previous number to continute adding to.

;Test
(dsp "Add CN")
(nl)
(define seven-cn (add-church cn-five cn-two))
seven-cn
((seven-cn inc) 0)


;Multiply
(define mult-church (lambda (n m) (lambda (f) (lambda (x) ((n (m f)) x)))))

;(n (m f ....) is the key here. m f is evulated, so, let's say five applications of f is returned. That's applied to another CN, say three. So five applied 3 times is 15...

;Test Multiply
(dsp "Multiply CN")
(nl)
(define cn-ten (mult-church cn-five cn-two))
cn-ten
((cn-ten inc) 0)

(((mult-church cn-ten cn-two) inc) 0)