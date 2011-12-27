(load "myhelpers.scm")
;Exercise 2.58


;SET UP
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
        (else
         (error "unknown expression type -- DERIV" exp))))

(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))

(define (addend s) (cadr s))

(define (augend s) (caddr s))

(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

(define (multiplier p) (cadr p))

(define (multiplicand p) (caddr p))


;: (deriv '(+ x 3) 'x)
;: (deriv '(* x y) 'x)
;: (deriv '(* (* x y) (+ x 3)) 'x)



;ANSWER

;Part A
;Change selectors. We only really need to change the augend and multiplicands along
;along with the predicates

;For sums
(define (addend s) (car s))
(define (sum? x)
  (and (pair? x) (eq? (cadr x) '+)))

;Test
(d "Sum tests")
(define e1 '(1 + 4))
(assert (addend e1) 1)
(assert (augend e1) 4)
(assert (sum? e1) #t)

;For Products
(define (multiplier p) (car p))
(define (product? x)
  (and (pair? x) (eq? (cadr x) '*)))

;tests
(d "Product Tests")
(define e2 '(3 * 9))
(assert (multiplier e2) 3)
(assert (multiplicand e2) 9)
(assert (product? e2) #t)

;Constructors
(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list a1 '+ a2))))

(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list m1 '* m2))))


(d "Part A Deriv test")
(deriv '(x + (3 * (x + 2))) 'x)
(deriv '((8 * x) + (3 * x)) 'x)
(deriv '((8 * y) + (3 * (x + (2 * x)))) 'x)

;PART B
;For sums

