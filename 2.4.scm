(load "myhelpers.scm")
(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

;Note: cons is a procedure that returns a procedure who's definition exists
;within the scope of its parent (cons). That means the returned procedure 
;has access to all of its parents free variables (x and y). The parent procedure's
;(cons) job is to take another procedure (car or cdr) as formal parameter m and then
;evaluate m with x and y as parameters. Car and cdr then select one of the parameters
;and return it;

;Answer
(define (cdr z)
  (z (lambda (p q) q))) ;Selects and returns arg 'q'

;Test
(define buzz (cons 9 40))
(assert 9 (car buzz))
(assert 40 (cdr buzz))