(load "./myhelpers.scm")

;From ex. 2.61
;Setup
(define (element-of-set-list? x set)
  (cond ((null? set) false)
        ((= x (car set)) true)
        ((< x (car set)) false)
        (else (element-of-set-list? x (cdr set)))))

(define (intersection-set-list set1 set2)
  (if (or (null? set1) (null? set2))
      '()
      (let ((x1 (car set1)) (x2 (car set2)))
        (cond ((= x1 x2)
               (cons x1
                     (intersection-set-list (cdr set1)
                                       (cdr set2))))
              ((< x1 x2)
               (intersection-set-list (cdr set1) set2))
              ((< x2 x1)
               (intersection-set-list set1 (cdr set2)))))))



;Ex 2.61 Answer
(define (adjoin-set-list x set)
  (cond ((null? set) (list x))
        ((= x (car set)) set) 
        ((> x (car set)) 
         (cons (car set) (adjoin-set-list x (cdr set))))
        ((< x (car set))
         (cons x set))
        (else (error "WTF!?"))))


(define (union-set-list s1 s2)
  (cond ((null? s1) s2)
        ((element-of-set-list? (car s1) s2)
         (union-set-list (cdr s1) s2))
        (else (union-set-list (cdr s1) (adjoin-set-list (car s1) s2)))))


;From exercise 2.63
;Setup

(define (entry tree) (car tree))

(define (left-branch tree) (cadr tree))

(define (right-branch tree) (caddr tree))

(define (make-tree entry left right)
  (list entry left right))


(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list (right-branch tree)
                                          result-list)))))
  (copy-to-list tree '()))


;From exercise 2.64
;Setup
(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
        (let ((left-result (partial-tree elts left-size)))
          (let ((left-tree (car left-result))
                (non-left-elts (cdr left-result))
                (right-size (- n (+ left-size 1))))
            (let ((this-entry (car non-left-elts))
                  (right-result (partial-tree (cdr non-left-elts)
                                              right-size)))
              (let ((right-tree (car right-result))
                    (remaining-elts (cdr right-result)))
                (cons (make-tree this-entry left-tree right-tree)
                      remaining-elts))))))))



;ANSWER!!
;Exercise 2.65

;Preemptive tests
(define fig2-16-3 '(5 (3 (1 () ()) ()) (9 (7 () ()) (11 () ()))))
(define tree1 fig2-16-3)
(define tree2 '(5 (4 (2 () ()) ()) (9 (7 () ()) (10 () ()))))

(d "Tree to list unions")
(assert (union-set-list (tree->list-2 tree1) (tree->list-2 tree1)) '(1 3 5 7 9 11))
(assert (union-set-list (tree->list-2 tree1) (tree->list-2 tree2)) '(1 2 3 4 5 7 9 10 11))


;Tree union implementation
(define (union-set-tree t1 t2)
  (let ((s1 (tree->list-2 t1))
        (s2 (tree->list-2 t2)))
    (list->tree (union-set-list s1 s2))))


;Test
(d "Tree Union")
(define tree-union-1-test (union-set-tree tree1 tree2))
(d tree-union-1-test)
(assert (tree->list-2 tree-union-1-test) (union-set-list (tree->list-2 tree1) (tree->list-2 tree2)))


;Tree intersection implementation
(define (intersection-set-tree t1 t2)
  (let ((s1 (tree->list-2 t1))
        (s2 (tree->list-2 t2)))
    (list->tree (intersection-set-list s1 s2))))
;Tests
(d "Tree Intersections")
(define tree-intersection-1-test (intersection-set-tree tree1 tree2))
(d tree-intersection-1-test)
(assert (tree->list-2 tree-intersection-1-test) (intersection-set-list (tree->list-2 tree1) (tree->list-2 tree2)))
