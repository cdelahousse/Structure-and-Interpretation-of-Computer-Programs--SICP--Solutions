#lang planet neil/sicp
(load "./myhelpers.scm")

;My answer

(define new-make-rat
  (lambda (n d) 
    (let ((n (if (eq? (abs d) d)
                 n
                 (- n)))
          (d (abs d)))
      (cons n d))))

;(d 'First)
;Test
;(assert (cons 3 3) (new-make-rat -3 -3))
;(assert (cons -3 3) (new-make-rat -3 3))
;(assert (cons -3 3) (new-make-rat 3 -3))

(new-make-rat -3 -3)

;Another implementation
(define (new-make-rat2 n d)
  (let ((n (if (> 0 d) (- n) n))
        (d (abs d)))
    (cons n d)))

;(d 'Second)
;Tests
;(assert (new-make-rat -3 -3) (new-make-rat2 -3 -3))
;(assert (new-make-rat -3 3) (new-make-rat2 -3 3))
;(assert (new-make-rat 3 -3) (new-make-rat2 3 -3))

;Better answer from Scheme Wiki
(define (make-rat n d)
  (let ((g ((if (< d 0) - +) (gcd n d)))) ;NOTE: Check out how they choose the prefix! Kewl!
    (cons (/ n g) (/ d g))))

;evaluates the operator before associating the data to g (of let). Scheme evaluates the operator before anything else
