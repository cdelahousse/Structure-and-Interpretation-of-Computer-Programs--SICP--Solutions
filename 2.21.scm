(load "myhelpers.scm")

(define lizz (list 1 2 3 4 5))
(define square (lambda (x) (* x x)))
;Exercise 2.21
(define (square-list items)
  (if (null? items)
      nil
      (cons (square (car items)) (square-list (cdr items)))))
;Test
(square-list lizz)

(define (square-list-map items)
  (map (lambda (x) (* x x)) items))

(square-list-map lizz)