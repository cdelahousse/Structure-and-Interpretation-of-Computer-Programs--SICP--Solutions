(load "myhelpers.scm")
;Exercise 2.36

;Spits out a list of the first of every sub list
(define (firsts l)
  (if (null? l)
      '()
      (cons (caar l) ;First of sub list
            (firsts (cdr l)))))

;Creates a list of remainders
(define (rests l)
  (if (null? l)
      '() 
      (cons (cdar l) ;Remainder of sublist
            (rests (cdr l)))))

;Tests
(define lizt '((1 2 3) (4 5 6) (7 8 9) (10 11 12)))
(assert (firsts lizt) '(1 4 7 10))
(assert (rests lizt) '((2 3) (5 6) (8 9) (11 12)))


;Functiont definitions
(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (firsts seqs)) ;Accumulate the first of every sublist
            (accumulate-n op init (rests seqs))))) ;Continue one rests of the sublists


;Tests
(assert (accumulate-n + 0 lizt) '(22 26 30))