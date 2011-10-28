(load "myhelpers.scm")

;Set up
;Reverse from ex 2.18 (for reference):
(define (reverse-iter l)
  (define (iter rev_list  curr_list)
    (if (null? curr_list)
        rev_list
        (iter (cons (car curr_list) rev_list) (cdr curr_list))))
  (iter (list (car l)) (cdr l)))

;Exercise 2.39

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

;Using fold-left
(define (reverse l)
  (fold-left (lambda (rev_list curr_item)
               (cons curr_item rev_list))
             '()
             l))

(assert (reverse (list 1 2 3 4)) '(4 3 2 1))

;Note:Whe approaching this problem (define this procedure in terms of another), I compare the most similar parts of each and then combine. The iterative nature of foldleft and reverse made them the perfect first attempt. I then when at them line by line.

;NOTE: Keep in mind the inputs and outputs of the lambda. Remember that the lambda (op) defined with fold left will be passed different inputs than the one with fold right. A trick I found was to name the parameters of the lambda function and then build the rest of the lamda. Notice the rev_list and curr_item are switched in the lambda paramerters of both procdures?

;Another note: keep in mind what will be passed into the lambda vs what operations are done in the original functions. (eg. compare (car curr_list) in the original reverse and (car rest) being passed as a curr_item in the lambda of fold left reverse.


;Using fold-right 
(define (fold-right op initial sequence)
   (if (null? sequence)
       initial
       (op (car sequence)
           (fold-right op initial (cdr sequence)))))



(define (reverse l)
  (fold-right (lambda (curr_item rev_list)
               (append rev_list (list curr_item)))
             '()
             l))

(assert (reverse (list 1 2 3 4)) '(4 3 2 1))


