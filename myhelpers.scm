(define nl newline)
(define (d x) (display x)(nl))

(define square
  (lambda (x)
    (* x x)))

(define (atom? x)
  (not (pair? x)))