(load "./myhelpers.scm")

;Exercise 3.2

(define (make-monitored fn)
  (let ((counter 0))
  (define (dispatch message)
    (cond ((eq? message 'how-many-calls?) counter)
          ((eq? message 'reset-counter) (set! counter 0))
          (else (begin (set! counter (+ 1 counter))
                       (fn message)))))
    dispatch))

(define mf (make-monitored sqrt))

(assert (mf 100) 10)
(assert (mf 'how-many-calls?) 1)
(begin (mf 100) (mf 100) (mf 100))
(assert (mf 'how-many-calls?) 4)

(mf 'reset-counter)
(assert (mf 'how-many-calls?) 0)
(begin (mf 100) (mf 100) (mf 100))
(assert (mf 'how-many-calls?) 3)