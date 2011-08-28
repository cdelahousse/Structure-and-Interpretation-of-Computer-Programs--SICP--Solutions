;; Scheme calculator -- evaluate simple expressions

#|
To run the calculator program, load this file into STk with (load "hw1.scm")
and call the calc function: (calc)

Try out some simple expressions with addition and subtraction
to get a feel for the program. It is essentially a subset of
Scheme with only the +, -, *, and / procedures supported.

For example:
STk> (load "hw1.scm")
okay
STk> (calc)
calc: (+ (+ 2 3) (- 5 6) 4)

You have to implement *-helper, ^-helper, and /-helper for this assignment.
|#

;; The read-eval-print loop:
(define (calc)
  (display "calc: ")

  (print (calc-eval (read)))
  (calc))

;; Evaluate an expression:
(define (calc-eval exp)
  (cond ((number? exp) exp)
	((list? exp) (calc-apply (first exp) (every calc-eval (bf exp))))
	(else (error "Calc: bad expression:" exp))))

;; Apply a function to arguments:
(define (calc-apply fn args)
  (cond ((eq? fn '+) (accumulate + 0 args))
	((eq? fn '-) (cond ((null? args) (error "Calc: no args to -"))
			   ((= (count args) 1) (- (first args)))
			   (else (- (first args) (accumulate + 0 (bf args))))))
	((eq? fn '*) (if (= 2 (count args))
			 (apply *-helper args)
			 (error "Calc: * takes 2 args")))
	((eq? fn '/) (if (= 2 (count args))
			 (apply /-helper args)
			 (error "Calc: / takes 2 args")))
	((eq? fn '^) (if (= 2 (count args))
			 (apply ^-helper args)
			 (error "Calc: ^ takes 2 args")))
	((eq? fn '**) (if (= 2 (count args))
			 (apply karatsuba args)
			 (error "Calc: Fast Multiplication takes 2 args")))
	(else (error "Calc: bad operator:" fn))))

;;; Homework starts here!
;; Fill in these procedures

;; Section 1
;; Question 1
(define (*-helper a b)
  (cond ((= b 0) 0)
        ((= b 1) a)
        (else (+ a (*-helper a (- b 1))))))

;; Question 2
(define (^-helper a b)
  (error "Not Implemented!") ;; Your code goes here
  )

;; Question 3
(define (/-helper a b)
  (error "Not Implemented!") ;; Your code goes here
  )
  
;; Question 4
(define (karatsuba             )
 ;; You will have to come up with the procedure header and such on your own!
 
  (error "Not Implemented!") ;; Your code goes here
 )
 
 ;; Section 2: Recursion
 ;; Question 1
(define (squares nums)
  (error "Not Implemented!") ;; Your code goes here
 )
 
 ;; Question 2
(define (switch sent)
  (error "Not Implemented!") ;; Your code goes here
 )
 
 ;; Question 3a
(define (first-streak strk)
  (error "Not Implemented!") ;; Your code goes here
 )
 ;; Question 3b
(define (best-streak strk)
 (error "Not Implemented!") ;; Your code goes here
 )
 
 
 ;; Section 3: Higher Order Procedures
 
 ;; Question 1:
 (define (my-every fn sent)
   (error "Not Implemented!") ;; Your code goes here
 )
 
 ;; Question 2:
 (define (repeated fn ntimes)
   (error "Not Implemented!") ;; Your code goes here
 )
 
 ;; Question 3a:
 (define (insert new-num sorted-sent)
    (error "Not Implemented!") ;; Your code goes here
 )
 
 ;; Question 3b:
 (define (insertion-sort unsorted-sent)
	(define (insertion-sort-helper unsorted-sent sorted-sent)
          (error "Not Implemented!") ;; Your code goes here
	)
    (insertion-sort-helper unsorted-sent '())

  )
  
 
 ;; Question 3c:
 (define (hof-insertion-sort comparator sent)
   (error "Not Implemented!") ;; Your code goes here
 ) 
 
