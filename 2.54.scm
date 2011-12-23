(load "myhelpers.scm")

;Exercise 2.54

;Setup
(define old-equal? equal?)

;The new equal? procedure conflicts with my assert procedure
(define assert
  (lambda (test-value should-equal)
    (set! test-number (inc test-number))
    (display test-number)
    (display ") ")
    (if (old-equal? test-value should-equal)
        (display 'Yaw:)
        (display 'Nawwwww!:))
    (display " ")
    (display test-value)
    (display " ==> ")
    (display should-equal)
    (newline)))



(define (equal? l1 l2)
  (if (and (atom? l1) (atom? l1)) ;If atomic, use eq?
      (eq? l1 l2) ;Returns evaluated predicate (#true or false)
      ;Recur on car and cdr separately. Use 'and' to ensure everything returned is true
      (and (equal? (car l1) (car l2)) (equal? (cdr l1) (cdr l2)))))
;Tests
(define list1 '(this is a list))
(define list2 '(this (is a) list))
(define list3 '(this is not a list))

(assert (equal? list1 list1) #t)
(assert (equal? list1 list2) #f)
(assert (equal? list1 list3) #f)
(assert (equal? list2 list2) #t)

;Note: Since my implementation of scheme uses eq? in the same manner that I'm trying 
;implement equal?, we'll make the true clause of the if statement more specific using
;the symbol? predicate.

(define (equal? l1 l2)
  (if (and (atom? l1) (atom? l1))
      (if (and (null? l1) (null? l2)) ;since (symbol? '()) does not equal true
          #t:q
          (and (symbol? l1) (symbol? l2) (eq? l1 l2)))
      (and (equal? (car l1) (car l2)) (equal? (cdr l1) (cdr l2)))))


(assert (equal? list1 list1) #t)
(assert (equal? list1 list2) #f)
(assert (equal? list1 list3) #f)
(assert (equal? list2 list2) #t)


 