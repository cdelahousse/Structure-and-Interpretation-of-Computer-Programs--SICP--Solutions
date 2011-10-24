(load "myhelpers.scm")

;Exersize 2.30
(define (square-tree tree)
  (cond ((null? tree) '())
        ((atom? tree) (square tree))
        (else (cons (square-tree (car tree)) (square-tree (cdr tree))))))



(define l (list 1
                (list 2 (list 3 4) 5)
                (list 6 7)))

(define answer '(1 (4 (9 16) 25) (36 49)))

(d "No Map")
(assert (square-tree l) answer)


;Exersize 2.30 -- Without using MAP function
(define (square-tree-map tree)
  (map (lambda (sub-tree) 
         (if (atom? sub-tree)
             (square sub-tree)
             (square-tree-map sub-tree)))
       tree))

(d "With Map")
(assert (square-tree-map l) answer)