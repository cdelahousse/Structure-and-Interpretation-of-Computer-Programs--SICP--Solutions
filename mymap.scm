(load "myhelpers.scm")

(define (map fn l)
  (if (null? l)
      nil
      (cons (fn (car l)) (map fn (cdr l))))) 

(define liszt (list 1 2 3 4))
(define nil '())

;test
;(map square liszt)

(define datum car)
(define children cdr)
(define make-tree cons)

;The datum, children and make tree create an abstraction barrier THAT MUST BE RESPECTED!!! That means we could easily change the represention. WE SHOULD NEVER NEED TO THINK ABOUT REPRESENTATION, just abstraction.

(define map-tree
  (lambda (fn tree)
    (make-tree (fn (datum tree))
          (map (lambda (t)
                 (map-tree fn t))
               (children tree)))))


(define triz '(1 (2 (5) (6)) (3 (7) (8))))
(d triz)
;test
(d (map-tree square triz))