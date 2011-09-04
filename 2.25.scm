;Exercise 2.25
(define l1 '(1 3 (5 7) 9))
(car (cdr (car (cdr (cdr l1)))))

(define l2 '((7)))

(car (car l2))

(define l3 '(1 (2 (3 (4 (5 (6 7)))))))
;(cdr (cdr (cdr (cdr (cdr (car (cdr l3)))))))
(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr l3))))))))))))
;See drawing for ex 2.24 to understand why we do cadr