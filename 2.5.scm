;This further shows how abstraction separates for representation
(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

;Factorise this until we can no longer divide
(define (factorise-until-cant cons_number base)
  (define (iter lump counter)
    (if (zero? (remainder lump base))
               (iter (/ lump base) (inc counter))
               counter))
  (iter cons_number 0))


(define (car cons_number)
  (factorise-until-cant cons_number 2))
(define (cdr cons_number)
  (factorise-until-cant cons_number 3))

;Test
(let ((conz (cons 4 5)))
  (display conz)
  (newline)
  (display (car conz))
  (newline)
  (display (cdr conz))
  (newline))

(define conzer (cons 5 5))
conzer
(car conzer)
(cdr conzer)