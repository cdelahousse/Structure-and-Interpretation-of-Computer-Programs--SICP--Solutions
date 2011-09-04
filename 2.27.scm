(define (append l1 l2)
  (if (null? l1)
      l2
      (cons (car l1) (append (cdr l1) l2))))


(define (reverse l)
  (if (null? l)
      l
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

;(define (deep-reverse-iter l)
 ; (define (iter newlist oldlist)
  ;  (cond ((null? oldlist) newlist)
   ;       ((atom? (car oldlist) )
    ;       (else (
          
           
    

;Test
(atom? 'a)
(atom? '(a b))
(atom? (cdr '(a b)))
(display (cdr '(a b)))
(newline)
(car (cdr '(a b)))

(define x (list (list 1 2) (list 3 4)))
(display x)
(newline)
(display "reverse")
(newline)
(display (reverse x))
(newline)
;(display "deep revers iter")
;(newline)
;(display (deep-reverse-iter x))
(newline)
(display "deep revers")
(newline)
(display (deep-reverse x))
(newline)
(display (deep-reverse '(1)))
(newline)
(display (deep-reverse '1))
(newline)
(display (deep-reverse '()))
      