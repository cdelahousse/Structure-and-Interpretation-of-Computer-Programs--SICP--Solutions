(load "myhelpers.scm")

;Exercise 2.38


(define fold-right accumulate)

;OR, let's redefine it...

;Note: fold-right IS RECURSIVE!!!
(define (fold-right op initial sequence)
   (if (null? sequence)
       initial
       (op (car sequence)
           (fold-right op initial (cdr sequence)))))


(fold-right / 1 (list 1 2 3)) ;3/2

;How? Here's how...
;(fr / 1 (list 1 2 3))
;(/ 1 (fr / 1 (list 2 3)))
;(/ 1 (/ 2 (fr / 1 (list 3))))
;(/ 1 (/ 2 (/ 3 (fr / 1 (list)))))
(/ 1 (/ 2 (/ 3 1)))
;(/ 1 (/ 2 3))
;(/ 1 2/3)
;3/2


;fold-left is ITERATIVE!
(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(fold-left / 1 (list 1 2 3)) ;1/6
;"Huh?" you ask? Here's how:
;(fl / 1 (list 1 2 3))
;(iter 1 (list 1 2 3))
;(iter (/ 1 1) (list 2 3))
;(iter (/ 1 2) (list 3))
;(iter (/ 1/2 3) '())
;(iter 1/6 '())
;1/6

;NOTE: Fold-left is iterative, fold right is recursive. That means that if you want to operate left to right (fold left) you're better off using iterative processes. When going from right to left (accumulate or fold right), you should use recursion. This is because you need to cdr down the entire list before you can apply the operations... You're defering the work until the last element is chosen (eg. the right most element of a list). With fold left, you can easily use an iterative process because you're doing calculations with the left most element of a flat list. No need to defer operations because knowing what is the last element isn't important.


(d (fold-right list nil (list 1 2 3)))
(d (fold-left list nil (list 1 2 3)))



;Common operations
(define oper +)
(assert (fold-right oper 0 (list 1 2 3 4)) (fold-left oper 0 (list 1 2 3 4)))

(define oper *)
(assert (fold-right oper 1 (list 1 2 3 4)) (fold-left oper 1 (list 1 2 3 4)))

;Basically, any communitative operations will do.
;Union of sets, Scalar vector or matrix multiplication should also work.
; (op A B) must equal (op B A)
; Good: A*B == B*A 
; Bad: A/B != B/A
