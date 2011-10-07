
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

(define (mrec a b)
  (display a) (display " ") (display b)(nl)
  (cond ((= 0 b) a)
        ((even? b) (dbl (mrec a (halve b))))
        (else (+ a (mrec a (dec b))))))


(define mr mrec)

(mr 2 2)
(mr 2 3)
(mr 2 4)
(assert (mr 4 9) (* 4 9))


