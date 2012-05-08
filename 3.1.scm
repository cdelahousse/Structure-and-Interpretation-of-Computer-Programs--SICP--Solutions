(load "./myhelpers.scm")

;3.1 Answer

(define make-accumulator
  (lambda (init) 
    (lambda (new-val)
      (begin 
        (set! init (+ new-val init))
        init))))

(define A (make-accumulator 5))

(assert (A 10) 15)

(assert (A 10) 25)