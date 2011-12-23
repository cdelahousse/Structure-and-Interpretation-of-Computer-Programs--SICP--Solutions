(define nl newline)
(define (d x) (display x)(nl))

(define square
  (lambda (x)
    (* x x)))

(define (one? n)
  (= n 1))
  
;atom? means 'is this element atomic?' It can NOT be broken down into
;smaller components. Symbols, (quote words), number, etc are considered 
;atoms.
;I use atom? as a convention instead of (not (pair? x)) because I learned
;Scheme from 'The Little Schemer'. I find it's a better and much clearer 
;predicate.
(define (atom? x)
  (not (pair? x)))

(define test-number 0)

(define assert
  (lambda (test-value should-equal)
    (set! test-number (inc test-number))
    (display test-number)
    (display ") ")
    (if (equal? test-value should-equal)
        (display 'Yaw:)
        (display 'Nawwwww!:))
    (display " ")
    (display test-value)
    (display " ==> ")
    (display should-equal)
    (newline)))

;Tree-map from exercise 2.31
(define (tree-map f tree)
  (map (lambda (sub-tree)
         (if (atom? sub-tree)
             (f sub-tree)
             (tree-map f sub-tree)))
       tree))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(define (flatmap proc sequence)
  (accumulate append nil (map proc sequence)))


(define (enumerate-interval low high) 
  (if (> low high) 
      nil 
      (cons low (enumerate-interval (inc low) high))))

