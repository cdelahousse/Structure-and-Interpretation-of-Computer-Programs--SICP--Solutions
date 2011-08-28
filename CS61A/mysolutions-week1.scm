#lang planet dyoo/simply-scheme:2 1
(define p print)
;WEEK 1A
;Simply scheme
(define expt
  (lambda (b e)
    (if (= e 0)
        1
        (* b (expt b (- e 1))))))
;Test
(print 'expt)
(newline)
(expt 3 4)


;COUNT Stay ways n
;REVIEW!!!
;Insight: With this type of recursion, meaning not loops. Think base cases and delagation.

(define (count-stair-ways n)
  (cond ((= n 1) n) ;1 way
        ((= n 2) n) ;2 ways
        (else (+ (count-stair-ways (- n 1))
                 (count-stair-ways (- n 2))))))

;Test
(print 'count-stair-ways)
(newline)
(count-stair-ways 10)

;Subsent
(define subsent
  (lambda (sent i)
    (if (= i 0)
        sent
        (subsent (bf sent) (- i 1)))))

;test
(print 'subsent)
(subsent '(1 2 3 4 5 6 7 8) 4)


;Count ways origin to x, y
;REVIEW!
(define count-ways
  (lambda (x y)
    (cond ((or (< x 0) (< y 0)) 0)
          ((and (= y 0) (= x 0)) 1)
          (else (+ (count-ways (- x 1) y)
                   (count-ways  x (- y 1)))))))

;test
(print 'count-ways)
(count-ways 6 6)


;Sum of sents sen1 sen2


(define sum-of-sents
  (lambda (s1 s2)
    (cond ((empty? s1) s2)
          ((empty? s2) s1)
          (else (se (+ (first s1) (first s2))
                    (sum-of-sents (bf s1) (bf s2)))))))
;test
(print 'sum-of-sents)
(sum-of-sents '(1 2 3) '(1 2 3 4 5))



;WEEK 1B

;First-satisfies
(define first-satisfies 
  (lambda (pred? sent)
    (cond ((empty? sent) #f)
          ((pred? (first sent)) (first sent))
          (else (first-satisfies pred? (bf sent))))))

;test
(print 'first-satisfies)
(first-satisfies even? '(1 3 2 3 5 4))

;Lessthan x
(define lessthan
  (lambda (n)
    (lambda (x)
      (< x n))))
;test
(p 'lessthan)
((lessthan 6) 5)