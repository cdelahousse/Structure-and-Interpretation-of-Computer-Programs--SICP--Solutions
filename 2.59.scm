(load "./myhelpers.scm")

;Exercise 2.59

;Setup
(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((equal? x (car set)) #t)
        (else (element-of-set? x (cdr set)))))

;Answer
(define (union s1 s2)
  (cond ((null? s1) s2)
        ((element-of-set? (car s1) s2)
         (union (cdr s1) s2))
        (else (cons (car s1) (union (cdr s1) s2)))))



;Tests
(define l1 '(a b c d))
(define l2 '(e f g))
(define l3 '(a b g))

(d (union l1 l3))
(d (union l2 l3))

;Another implementation I came up with 
(define (union s1 s2)
  (append s1 (filter (lambda (x)
                       (not (element-of-set? x s1)))
                     s2)))
(d (union l1 l3))
(d (union l2 l3))