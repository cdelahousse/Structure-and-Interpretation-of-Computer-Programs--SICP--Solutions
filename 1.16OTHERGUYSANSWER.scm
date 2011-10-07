#lang scheme
;(load "myhelpers.scm")
;(display "New stuff")
(define (square x) (* x x))
(define (fast-expt b n)
  ;(define (even? n)
  ;(= (remainder n 2) 0))
  (display 'a) (display " ") (display 'b)(display " ") (display 'n)(newline)
  (expt-iter b n 1))


(define (expt-iter b n a)
  (display a) (display " ")(display b) (display " ") (display n)(newline)
  (cond ((= n 0) a)
        ((even? n) (expt-iter (square b) (/ n 2) a))
        (else (expt-iter b (- n 1) (* a b)))))


;NB: 2/2 = 1 which is uneven

(define fe fast-expt)
(fast-expt 2 6)
(fe 2 0)
(fe 2 1)
(fe 2 2)
(fe 2 3)
(fe 2 4)
(fe 2 5)
(fe 2 6)
(fe 2 7)
