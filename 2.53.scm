(load "myhelpers.scm")

;Exercise 2.53

;Setup
(define (memq item x)
  (cond ((null? x) false)
        ((eq? item (car x)) x)
        (else (memq item (cdr x)))))

;Tests
(d (list 'a 'b 'c))

(d (list (list 'george)))

(d (cdr '((x1 x2) (y1 y2))))

(d (cadr '((x1 x2) (y1 y2))))

(d (pair? (car '(a short list))))
 
(d (memq 'red '((red shoes) (blue socks))))
;False because (car '((red shoes) (blue socks)) is '(red shoes)
;and not 'red
 
(d (memq 'red '(red shoes blue socks)))


