(load "myhelpers.scm")

;Recursive definition
(define (fn-recur n)
  (cond ((< n 3) n)
        (else (+ (fn-recur (- n 1))
                 (* 2 (fn-recur (- n 2)))
                 (* 3 (fn-recur (- n 3)))))))
(fn-recur 1)
(fn-recur 2)
(fn-recur 3)
(fn-recur 4)
(fn-recur 5)
(fn-recur 6)
(fn-recur 7)
(fn-recur 8)

;Interative definition
(define (fn-iter n)
  (define (iter prev-sum pp-sum ppp-sum count)
    (cond ((< n 3) n)
          ((< n count) prev-sum) 
          (else (iter (+ prev-sum (* 2 pp-sum) (* 3 ppp-sum))
                      prev-sum 
                      pp-sum
                      (inc count)))))
  (iter 2 1 0 3)) ;so when N > 3, the first sums are 2 1 0.

;The trick with iterative defintions is remembering to work for the bottom up. YOu increment from 1 to N while maintaining state (variables). With recursive defintions, you decrement N to 1. Iterative processes are bottom up, recursive processes are top down.
(d "Iterative 1") 
(assert (fn-iter 1) (fn-recur 1))
(assert (fn-iter 2) (fn-recur 2))
(assert (fn-iter 4) (fn-recur 4))
(assert (fn-iter 5) (fn-recur 5))
(nl)
(fn-iter 1)
(fn-iter 2)
(fn-iter 3)
(fn-iter 4)
(fn-iter 5)
(fn-iter 6)
(fn-iter 7)
(fn-iter 8)

;Interative definition 2 - cleaner
(define (fn-iter n)
  (define (iter prev-sum pp-sum ppp-sum count)
    (cond
      ((> 3 count) prev-sum)
      (else (iter (+ prev-sum (* 2 pp-sum) (* 3 ppp-sum)) ;this will the new sum in the next iteration
                  prev-sum ;prev-sum is shifted right
                  pp-sum ;so is pp-sum
                  (dec count))))) ;counter
  (if  (< n 3)
       n
       (iter 2 1 0 n)))

;The sums are still going bottom up, but the counter increments down
(d "Iterative 2") 
(assert (fn-iter 1) (fn-recur 1))
(assert (fn-iter 2) (fn-recur 2))
(assert (fn-iter 4) (fn-recur 4))
(assert (fn-iter 5) (fn-recur 5))
(nl)
(fn-iter 1)
(fn-iter 2)
(fn-iter 3)
(fn-iter 4)
(fn-iter 5)
(fn-iter 6)
(fn-iter 7)
(fn-iter 8)

;Interative definition 3 - See first cond line
(define (fn-iter n)
  (define (iter prev-sum pp-sum ppp-sum count)
    (cond
      ((= 0 count) ppp-sum) ;Se take ppp-sum because SUM calculations continue past
      (else (iter (+ prev-sum (* 2 pp-sum) (* 3 ppp-sum)) ;this will the new sum in the next iteration
                  prev-sum ;prev-sum is shifted right
                  pp-sum ;so is pp-sum
                  (dec count))))) ;counter
  (if  (< n 3)
       n
       (iter 2 1 0 n)))


(d "Iterative 3") 
(assert (fn-iter 1) (fn-recur 1))
(assert (fn-iter 2) (fn-recur 2))
(assert (fn-iter 4) (fn-recur 4))
(assert (fn-iter 5) (fn-recur 5))
(nl)
(fn-iter 1)
(fn-iter 2)
(fn-iter 3)
(fn-iter 4)
(fn-iter 5)
(fn-iter 6)
(fn-iter 7)
(fn-iter 8)



