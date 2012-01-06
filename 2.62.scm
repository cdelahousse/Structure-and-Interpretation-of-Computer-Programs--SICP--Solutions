(load "./myhelpers.scm")

;Exercise 2.62
;
;Setup

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (car set)) true)
        ((< x (car set)) false)
        (else (element-of-set? x (cdr set)))))

;From ex. 2.61
(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((= x (car set)) set) 
        ((> x (car set)) 
         (cons (car set) (adjoin-set x (cdr set))))
        ((< x (car set))
         (cons x set))
        (else (error "WTF!?"))))

;Answer
(define (union-set s1 s2)
  (cond ((null? s1) s2)
        ((element-of-set? (car s1) s2)
         (union-set (cdr s1) s2))
        (else (union-set (cdr s1) (adjoin-set (car s1) s2)))))

;Tests
(define l1 '(1 2 3 4))
(define l2 '(3 4 5))

(assert (union-set l1 l2) '(1 2 3 4 5))
(assert (union-set l1 '(1 2 3 4 5 6 7 8)) '(1 2 3 4 5 6 7 8))
(assert (union-set l2 l1) '(1 2 3 4 5))