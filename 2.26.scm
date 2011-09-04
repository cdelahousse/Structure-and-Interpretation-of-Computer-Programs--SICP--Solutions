;Display
(define (d x) (display x)(newline))
(define x (list 1 2 3))
(define y (list 4 5 6))

(d "append")
(d (append x y))
;Same as 
(d (cons 1 (cons 2 (cons 3 '(4 5 6)))))
;SEE DISCUSSION FOR MY ANSWER TO 2.27 relating to append

(d "cons")
(d (cons x y))
;Same as consing a list to the first part of a sequence
(d (cons (cons 1 (cons 2 (cons 3 nil))) (cons 4 (cons 5 (cons 6 nil)))))
;and same as
(d (cons '(1 2 3) (cons 4 (cons 5 (cons 6 nil)))))

(d "list")
;Creates a list of two lists, a sequence containing 2 lists
(d (list x y))
(d (cons '(1 2 3) (cons '(4 5 6) nil)))