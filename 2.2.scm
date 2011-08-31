
(load "test.scm")

(load "codefrombook/ch2support.scm")
;; EXERCISE 2.2
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))
;abstraction of pairs to create points
(define make-point cons) ;constructor
(define x-point car) ;selector
(define y-point cdr) ;selector

(display "Test make point")
(newline)
(let ((p (make-point 2 3)))
  (display p)
  (display "  ")
  (print-point p))

;abstraction to create segments. No need to think of points
(define (make-segment p1 p2)
  (cons p1 p2))
(define (start-segment s)
  (car s))
(define (end-segment s)
  (cdr s))

(newline)
(display "Test make segment")
(newline)
(let ((s (make-segment (make-point 2 3) (make-point 4 5))))
  (display s)
  (display "  ")
  (print-point (start-segment s))
  (display "  ")
  (print-point (end-segment s)))

;Takes segments, not points, another level of abstraction
(define mid-point
  (lambda (s)
    (define (average a b) (/ (+ a b) 2))
    (let ((s1 (start-segment s))
          (s2 (end-segment s)))
      (make-point (average (x-point s1) (x-point s2))
                  (average (y-point s1) (y-point s2))))))

;Test
(newline)
(display "Test mid point")
(newline)
(let ((s (make-segment (make-point -2.35 -3.5) (make-point 4 5))))
  (display s)
  (display "  ")
  (newline)
  (print-point (mid-point s))
  (display "  "))
