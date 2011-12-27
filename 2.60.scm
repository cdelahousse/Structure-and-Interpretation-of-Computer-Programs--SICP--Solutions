(load "./myhelpers.scm")

;Exercise 2.60

;Setup
(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((equal? x (car set)) #t)
        (else (element-of-set? x (cdr set)))))

;ANSWERS
;Adjoin set: becomes cons. Big Oh of O(1)
(define adjoin-set cons) 

;Test
(d (adjoin-set 'x '(a b c d x)))

;Union: becomes append. O(n)
(define union append)
(d (union '(1 2 3 4 5) '(a b 1 2 f)))

;Intersection and element-of-set? remain the same
; We'd prefer the new union and Adjoin whenever possible. They're quicker because there
;isn't anymore checking