(load "./myhelpers.scm")

;Exercise 2.61

;Setup

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (car set)) true)
        ((< x (car set)) false)
        (else (element-of-set? x (cdr set)))))

;Answer
(define (adjoin-set x set)
  (cond ((null? set) (list x)) ;end of set, meaning x > set. Return inital list (cons x nil)
        ((= x (car set)) set) ;If x is already in set, return remainder of set
        ((> x (car set)) 
         (cons (car set) (adjoin-set x (cdr set))))
        ((< x (car set))
         (cons x set))
        (else (error "WTF!?"))))

;Tests
(assert (adjoin-set 6 '(1 2 3)) '(1 2 3 6))
(assert (adjoin-set 2 '(1 2 3)) '(1 2 3))
(assert (adjoin-set 1 '(1 2 3)) '(1 2 3))
(assert (adjoin-set 1 '(2 3 4)) '(1 2 3 4))
