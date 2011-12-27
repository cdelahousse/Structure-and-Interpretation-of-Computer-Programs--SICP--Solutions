
(load "myhelpers.scm")
;Set Up

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


(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

(define (multiplier p) (cadr p))


;FROM 2.56 answer

(define (exponentiation? x)
  (and (pair? x) (eq? (car x) '**)))


;Constructor
(define (make-exponentiation base exponent)
  (list '** base exponent))

;Selectors
(define (base exp)
  (car (cdr exp)))

(define (exponent exp)
  (car (cdr (cdr exp))))

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

;ANSWER

;Augend. NOTE: Will be called by derive function,
(define (augend s) 
  (let ((t (cddr s)))
    (if (pair? (cdr t)) 
        ;This values (another list prefixed by +) will be evaluated again by deriv.
        (cons '+ t) ; It's a pair, so there is more numbers to add.
        (car t))));The remainder is not a pair, meaning (car t) is the last value of the sum

;I initially implemented augend with either make-sum or augend because I knew it 
;needed some type of recursion so that all numbers in the sum were evaluated. Well,
;as it turns out, in the deriv procedure, if the augend returns a sum, deriv will 
;recur on that returned sum expression. That was the recursion needed!


;Test
(d (augend '(+ a b)))
(d (augend '(+ a b c)))
(d (augend '(+ a b c d)))
(d (augend '(+ a b c d e)))
(d (deriv '(+ x x x x) 'x))


;Another implementation
(define (augend s)
  (accumulate make-sum 0 (cddr s)))


(d (augend '(+ a b)))
(d (augend '(+ a b c)))
(d (augend '(+ a b c d)))
(d (augend '(+ a b c d e)))
(d (deriv '(+ x x x x) 'x))

;Another implementation
(define (augend s) 
  (let ((t (cddr s)))
    (if (atom? (cdr t)) 
        (car t)
        (cons '+ t) )))

;Multiplicand
(define (multiplicand p)
  (let ((t (cddr p)))
    (if (atom? (cdr t))
        (car t)
        (cons '* (cdr t)))))
;(d (

;Test
(d (deriv '(* x y (+ x 3) z) 'x))
