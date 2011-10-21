(load "myhelpers.scm")

(define (fringe l)
  (cond ((null? l) '())
        ((atom? l) (list l))
        (else (append (fringe (car l)) (fringe (cdr l))))))

;Test
(define testval (list (list 1 2) (list 3 4)))
(define testval2 (list (list 5 6 7) (list 8 9 10)))
(assert (fringe testval) '(1 2 3 4))
(assert (fringe  (list testval testval2)) '(1 2 3 4 5 6 7 8 9 10))


;(define (fringe-iter l)
;  (define (iter newlist oldlist)
;    (cond ((null? oldlist) newlist)
;          ((atom? (car oldlist)) 
;           (iter (append newlist (list (car oldlist))) (cdr oldlist)))
;          (else (iter newlist (car oldlist)))))
;  (iter nil l))

(define (fringe-recur l)
  (cond ((null? l) nil)
        ((atom? l) (list l)) ;Why list here an not on bottom line?
        (else (append (fringe-recur (car l)) (fringe-recur (cdr l)))))) 
; Because the bottom line recurs on 'other lists', it does the tree recursion. Append needs two lists and the only thing that won't be a list are atoms, so that's why the second cond line returns a 'listed' atom.


;Test
(define x (list (list 1 2) (list 3 4)))

;(d (fringe-iter x))
(d (fringe-recur x))
(d (fringe-recur (list x x)))
