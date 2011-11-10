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


;Test 3
(assert (accumulate-n + 0 lizt) '(22 26 30))


;Another implementation from Scheme Wiki, more elegant
(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs)) ;Accumulate the first of every sublist
            (accumulate-n op init (map cdr seqs))))) ;Continue one rests of the sublists

;Test #4
(assert (accumulate-n + 0 lizt) '(22 26 30))

;This is a much more scheme-y answer because it uses map. This abstracts away the creation of lists and lets you think about operations on lists instead.

;Even better would be to define selectors so that we could easily change the representation
(define (first x)
  (car x))

(define (rest x)
  (cdr x))


(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map first seqs)) 
            (accumulate-n op init (map rest seqs)))))

;Tests
;#5
(assert (accumulate-n + 0 lizt) '(22 26 30))