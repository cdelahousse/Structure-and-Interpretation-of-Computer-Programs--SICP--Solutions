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
  


(same-parity 1 2 3 4 5 6)
(same-parity 2 3 4 5 6 7)

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
            (iter f (cons newlist (cons item '())) (cdr oldlist))
            (iter f newlist (cdr oldlist))))))
    (iter (test n) '() l))

;Test
(same-parity-iter 1 2 3 4 5 6)
(same-parity-iter 2 3 4 5 6 7)