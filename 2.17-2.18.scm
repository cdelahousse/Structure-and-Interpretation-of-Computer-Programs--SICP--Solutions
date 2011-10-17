(load "./myhelpers.scm")

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
;(append (list 1 2 3) (list 4 5))

;exercise 2.17

;Iterative
(define (last list)
  (define (iter newlist lastlist)
    (if (null? newlist)
        lastlist
        (iter (cdr newlist) newlist)))
  (iter list list))

;Tests
;List
(assert (last (list 1 2 3 4 5)) (list 5))
;Empty list
(assert (last '()) '())

;Recursive
(define (last l)
  (if (null? (cdr l))
      (list (car l))
      (last (cdr l))))

;Tests
;List
(assert (last (list 1 2 3 4 5)) (list 5)) ;test 3
;Empty list
;(assert (last '()) '())


;exercise 2.18
(display "2.18\n")

;lets try it iteratively
(define (reverse-iter l)
  (define (iter newlist oldlist)
    (if (null? oldlist)
        newlist
        (iter (append (cons (car oldlist) nil) newlist) (cdr oldlist))))
  (iter '() l))
;Note: (cons <list> nil) is equivalent to (list (car l) because a one item list is (<item> '()) and nil is pretty much '()

;Test
(assert (reverse-iter (list 1 2 3 4 5)) (list 5 4 3 2 1))

;Another implementation without using append
(define (reverse-iter l)
  (define (iter rev_list  curr_list)
    (if (null? curr_list)
        rev_list
        (iter (cons (car curr_list) rev_list) (cdr curr_list))))
  (iter (list (car l)) (cdr l)))

;Test
(assert (reverse-iter (list 1 2 3 4 5)) (list 5 4 3 2 1))

;Recursive: Stolen from http://community.schemewiki.org/?sicp-ex-2.18
(define (reverse l)
  (if (null? l)
      l
      (append (reverse (cdr l)) (list (car l)))))
;NB -> appends needs two lists, that's why car l is made into a list
(assert (reverse (list 1 2 3 4 5)) (list 5 4 3 2 1))


(define (reverse l)
  (if (null? l)
      '() ;same as l
      (append (reverse (cdr l))
              (list (car l)))))

;test

(assert (reverse (list 1 2 3 4 5)) (list 5 4 3 2 1))

