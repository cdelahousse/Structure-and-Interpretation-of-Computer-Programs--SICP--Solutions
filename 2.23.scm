;Exercise 2.23

(define (for-each f l)
    (cond ((not (null? l)) 
           (f (car l))
           (for-each f (cdr l)))))

(for-each display (list 1 2 3))



