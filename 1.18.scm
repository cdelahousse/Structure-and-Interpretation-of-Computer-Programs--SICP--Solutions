(load "myhelpers.scm")


(define (halve n)
  (/ n 2))

(define (dbl n)
  (+ n n))

;My false answer
(define (m-iter a b)
  (define (iter sum count)      
    (cond ((zero? count) sum)
          ((even? count) (iter (dbl sum) (halve count)))
          (else (iter (+ sum a) (dec count)))))
  (iter a (dec b)))

(define double dbl)


;Good answer, from scheme wiki
(define (m-iter a b) 
  (define (iter accumulator a b) 
    (cond ((= b 0) accumulator) 
          ((even? b) (iter accumulator (double a) (halve b))) 
          (else (iter (+ accumulator a) a (- b 1))))) ;NB: Like fast expt, even answer will pass through here.
          ;Even when b is 2, it'll get halved, so b will be 1. There will always be a one! The accumulator only
          ;needs to accumulate on odd numbers. This is the same for exercise 1.16.
  (iter 0 a b)) 

(define mi m-iter)
(assert (mi 2 1) 2)
(assert (mi 2 2) 4)
(assert (mi 2 3) 6)
(assert (mi 2 4) 8)
(assert (mi 2 5) 10)
(assert (mi 2 6) 12)

