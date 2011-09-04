(define (append l1 l2)
  (if (null? l1)
      l2
      (cons (car l1) (append (cdr l1) l2))))

;NB: Append expections 2 lists
;Append substitution
;(append '(1 2) '(3 4))
;(cons (car '(1 2)) (append (cdr '(1 2)) '(3 4))))
;(cons 1 (append '(2) '(3 4))))
;(cons 1 (cons (car '(2)) (append (cdr '(2)) '(3 4))))
;(cons 1 (cons 2 (append '() '(3 4))))
;(cons 1 (cons 2 (if (null? '()) '(3 4)))))
;(cons 1 (cons 2 '(3 4))) ; ---> important SEE NOTE
;(cons 1 '(2 3 4))
;'(1 2 3 4)
;Note: at the point where process stacks coming back (evaluating the conses), you can see what would happen if the second argument you'd have given to append wouldn't be a list. It would be a sequence terminated by a pair (cons 3 4) -> (3 . 4) not a sequence terminated by a pair (cons 4 nil) -> '(4). You'd get (1 2 3 . 4) instead of '(1 2 3 4)


;test
(append (list 1 2 3) (list 4 5))

;exercise 2.17
(define last 
  (lambda (list)
    (define (iter new_list prev_list)
      (if (null? new_list)
          prev_list
          (iter (cdr new_list) new_list)))
    (iter list list)))

;Tests
;List
(last (list 1 2 3 4 5))
;Empty list
(last '())
        
;exercise 2.18

;Recursive
(define (reverse l)
  (if (null? l)
      l
      (append (reverse (cdr l)) (list (car l)))))
;NB -> appends needs two lists, that's why car l is made into a list

;test
(display "2.18\n")
(reverse (list 1 2 3 4 5))

;lets try it iteratively
(define (reverse-iter l)
  (define (iter newlist oldlist)
    (if (null? oldlist)
        newlist
        (iter (append (cons (car oldlist) nil) newlist) (cdr oldlist))))
  (iter '() l))
;Note: (cons <list> nil) is equivalent to (list (car l) because a one item list is (<item> '()) and nil is pretty much '()

;Test
(reverse-iter (list 1 2 3 4 5))

