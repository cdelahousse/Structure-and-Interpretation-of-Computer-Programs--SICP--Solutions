(load "myhelpers.scm")

;Setup
(define (enumerate-interval low high) 
  (if (> low high) 
      nil 
      (cons low (enumerate-interval (inc low) high))))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (make-sum-pair pair) 
   (list (car pair) (cadr pair) (+ (car pair) (cadr pair)))) 

;From section 12.6
(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))


;Excercise 2.40
(define (unique-pairs n)
  (flatmap (lambda (i)
             (map (lambda (j) 
                      (list i j))
                  (enumerate-interval 1 (dec i))))
           (enumerate-interval 1 n)))

;test
(assert (unique-pairs 3) '((2 1) (3 1) (3 2)) )

;Redefinition

(define (prime-sum-pairs n)
  (map make-sum-pair (filter prime-sum? (unique-pairs n))))

;Test
(assert (prime-sum-pairs 6) '((2 1 3) (3 2 5) (4 1 5) (4 3 7) (5 2 7) (6 1 7) (6 5 11)))
