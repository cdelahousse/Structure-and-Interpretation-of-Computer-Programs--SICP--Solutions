
(load "myhelpers.scm")

;Exercise 2.56

;Setup
(define (variable? x)
  (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list '+ a1 a2))))

(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list '* m1 m2))))



(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))

(define (addend s) (cadr s))

(define (augend s) (caddr s))

(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

(define (multiplier p) (cadr p))

(define (multiplicand p) (caddr p))



;ANSWERS

;Predicate
(define (exponentiation? x)
  (and (pair? x) (eq? (car x) '**)))

(assert (exponentiation? '(** base exponent)) #t)
(assert (exponentiation? '(x base exponent)) #f)

;Constructor
(define (make-exponentiation base exponent)
  (list '** base exponent))

;Selectors
(define (base exp)
  (car (cdr exp)))

(define (exponent exp)
  (car (cdr (cdr exp))))

(assert (base '(** (* 5 6) 8)) '(* 5 6))
(assert (exponent '(** (* 5 6) 8)) 8)

;Deriving proc

;IMPLEMENTATION With Simplification in deriving function
(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
          (make-product (multiplier exp)
                        (deriv (multiplicand exp) var))
          (make-product (deriv (multiplier exp) var)
                        (multiplicand exp))))
        ((exponentiation? exp)
         (make-product
          (cond
            ((= (- (exponent exp) 1) 0) 1)
            ((= (- (exponent exp) 1) 1) (base exp))
            (else 
             (make-product 
              (exponent exp)
              (make-exponentiation (base exp)
                                   (- (exponent exp) 1)))))
          (deriv (base exp) var)))
        (else
         (error "unknown expression type -- DERIV" exp))))

(d "Implentation 1")
(d (deriv '(** (* x y) 6) 'x))
(d (deriv '(** (* x y) 6) 'y))
(d (deriv '(** (* x y) 1) 'x))
(d (deriv '(** (* x y) 1) 'y))
(d (deriv '(** (* x y) 0) 'x))
(d (deriv '(** (* x y) 0) 'y))






;IMPLEMENATION With simplication in constructors. This, I think, is how it was intended.
;Deriv stays more of a simple abstraction and doesn't deal with any of the exponentiation
;reprensentations. 

;This way is better too because the modified exponent constructors can be used for other
;procedures

;Redefined constructor
;Constructor
(define (make-exponentiation base exponent)
  (cond ((= exponent 1) base)
        ((= exponent 0) 1)
        (else 
         (list '** base exponent))))


(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
          (make-product (multiplier exp)
                        (deriv (multiplicand exp) var))
          (make-product (deriv (multiplier exp) var)
                        (multiplicand exp))))
        ((exponentiation? exp)
         (make-product
          (make-product 
           (exponent exp)
           (make-exponentiation (base exp)
                                (- (exponent exp) 1)))
          (deriv (base exp) var)))
        (else
         (error "unknown expression type -- DERIV" exp))))


(d "Implentation 2")
(d (deriv '(** (* x y) 6) 'x))
(d (deriv '(** (* x y) 6) 'y))
(d (deriv '(** (* x y) 1) 'x))
(d (deriv '(** (* x y) 1) 'y))
(d (deriv '(** (* x y) 0) 'x))
(d (deriv '(** (* x y) 0) 'y))
