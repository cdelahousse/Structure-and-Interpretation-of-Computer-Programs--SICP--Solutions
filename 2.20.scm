(load "myhelpers.scm")

;Exercise 2.20
(define (same-parity n . l)
  (define (test num) 
    (if (even? num)
        even?
        odd?))
  (define (recur f l)
    (cond ((null? l) '())
          (else (if (f (car l))
                (cons (car l) (recur f (cdr l)))
                (recur f (cdr l))))))
  (recur (test n) (cons n l))) ;(cons n l) to add initial number to front

;test
(assert (same-parity 1 2 3 4 5 6) (list 1 3 5))
(assert (same-parity 2 3 4 5 6 7) (list 2 4 6))

;Another recursive implementation
(define (same-parity n . l)
  (define (filter f lst)
    (cond ((null? lst) '())
          ((f (car lst)) (cons (car lst) (filter f (cdr lst))))
          (else (filter f (cdr lst)))))
  (if (even? n)
      (cons n (filter even? (cdr l)))
      (cons n (filter odd? (cdr l)))))
  ;(if (even? n)
      

(assert (same-parity 1 2 3 4 5 6) (list 1 3 5))
(assert (same-parity 2 3 4 5 6 7) (list 2 4 6))

;Iteriverly
(define (same-parity-iter n . l)
  (define (test n)
    (if (even? n)
        even?
        odd?))
  (define (iter f newlist oldlist)
    (if (null? oldlist)
        (cons n newlist)
        (let ((item (car oldlist)))
          (if (f item)
            (iter f (append newlist (list item)) (cdr oldlist))
            (iter f newlist (cdr oldlist))))))
    (iter (test n) '() l))

;Test
(assert (same-parity-iter 1 2 3 4 5 6) (list 1 3 5))
(assert (same-parity-iter 2 3 4 5 6 7) (list 2 4 6))

;Another iterative implementation
(define (same-parity-iter n . l) 
  (define (iter f oldlist newlist)
    (cond ((null? oldlist) (cons n newlist))
          ((f (car oldlist)) (iter f (cdr oldlist) (append newlist (list (car oldlist)))))
          (else (iter f  (cdr oldlist) newlist))))
    (let ((t? (if (even? n) even? odd?)))
      (iter t? l '())))
        

;Test
(assert (same-parity-iter 1 2 3 4 5 6) (list 1 3 5))
(assert (same-parity-iter 2 3 4 5 6 7) (list 2 4 6))
