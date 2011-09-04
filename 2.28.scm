(load "myhelpers.scm")
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

;Test
(define x (list (list 1 2) (list 3 4)))

;(d (fringe-iter x))
(d (fringe-recur x))
(d (fringe-recur (list x x)))
