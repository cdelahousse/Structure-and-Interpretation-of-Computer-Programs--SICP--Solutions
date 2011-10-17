
(load "myhelpers.scm")

(define (halve n)
  (/ n 2))

(define (dbl n)
  (+ n n))

;(define (multirecur a b)
;(display a) (display " ") (display b)(nl)
; (cond ((= b 1) a)
;    (else (if (even? b)
;                 (multirecur (dbl a) (halve b))
;               (multirecur (inc a) (dec b))))))

(define (m-rec a b)
;  (display a) (display " ") (display b)(nl)
  (cond ((zero? b) 0) ;When b is zero, return zero and start defered calculations
        ((even? b) (dbl (m-rec a (halve b)))) ;Double what's been calculated so far and halve b
        (else (+ a (m-rec a (dec b)))))) ; Add one unit of b and decrement b


(define mr m-rec)

(assert 4 (mr 2 2))
(assert 6 (mr 2 3))
(assert 8 (mr 2 4))
(assert (mr 4 9) (* 4 9))
(assert (* 54 21) (mr 54 21))
(assert (* 54 21) (mr 21 54))

