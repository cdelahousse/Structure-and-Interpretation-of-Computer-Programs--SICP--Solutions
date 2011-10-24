(load "myhelpers.scm")

;Exercise 2.31

(define (tree-map f tree)
  (map (lambda (sub-tree)
         (if (atom? sub-tree)
             (f sub-tree)
             (tree-map f sub-tree)))
       tree))

;Test
(define l (list 1
                (list 2 (list 3 4) 5)
                (list 6 7)))

(define answer '(1 (4 (9 16) 25) (36 49)))

;Book definition requirement
(define (square-tree tree) (tree-map square tree))

(assert (square-tree l) answer)