(define (append l1 l2)
  (if (null? l1)
      l2
      (cons (car l1) (append (cdr l1) l2))))
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

