(load "myhelpers.scm")

(define (append l1 l2)
  (if (null? l1)
      l2
      (cons (car l1) (append (cdr l1) l2))))


(define (reverse l)
  (if (null? l)
      
      (append (reverse (cdr l)) (list (car l)))))

(define (reverse-iter l)
  (define (iter newlist oldlist)
    (if (null? oldlist)
        newlist
        (iter (append (cons (car oldlist) nil) newlist) (cdr oldlist))))
  (iter '() l))
;Note: (cons <list> nil) is equivalent to (list (car l) because a one item list is (<item> '()) and nil is pretty much '()

(define atom?
  (lambda (x)
    (not (pair? x))))

;Exercise 2.27
(define (deep-reverse l)
  (cond ((null? l) nil)
        ((atom? l) l)
        (else (append (deep-reverse (cdr l)) (list (deep-reverse (car l)))))))
;Note the last part has (list (deep-reverse (car l)) and not (deep-reverse (list (car l))). This is because  if (car l) is a list, it needs to be part of a list to be appended to the parent list. If it isn't a list, the items FROM (car l) will be added to the parent list as atoms. 
;Ex; if we want ((1 2) (3 4)) to be the result: 
;(append '(1 2) '(3 4)) ;-> (1 2 3 4)
;(append '((1 2)) '(3 4)) ;->((1 2) 3 4)
; BUT (append '((1 2)) '((3 4))) -> ((1 2) (3 4))

; So, whatever (car l) in the last line of the above function is, it must be made into a list to get an accurate representation of that it is.

          
(define (deep-reverse l)
  (cond ((null? l) '())
        ((atom? l) l)
        (else (append (deep-reverse (cdr l)) (cons (deep-reverse (car l)) nil)))))
;It's simple. Take a list. Recurn on the car and the cdr and append the result to each other in opposite order. 
;The ONLY difference between reverse (recursive ver) and deep-reverse is the extra line (with atom?) that differentiates between a list and an atom.
 

;Test

(define x (list (list 1 2) (list 3 4)))
(display "reverse")
(newline)

(assert (reverse x) (list '(3 4) '(1 2)))
(display "deep reverse")
(newline)
(assert (deep-reverse x) (list '(4 3) '(2 1)))
;(newline)
;(display (deep-reverse '(1)))
;(newline)
;(display (deep-reverse '1))
;(newline)
;(display (deep-reverse '()))



;(define (deep-reverse-iter l)
 ; (define (iter newlist oldlist)
  ;  (cond ((null? oldlist) newlist)
   ;       ((atom? (car oldlist) )
    ;       (else (