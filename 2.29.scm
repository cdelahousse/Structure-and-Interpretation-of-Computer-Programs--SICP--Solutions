(load "myhelpers.scm")

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

;Excercise 2.29
;a) selectors:

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))


(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

;b) total-weight

(define (total-weight mobile)
  (cond ((null? mobile) 0)
        ((atom? mobile) mobile) ;When branch-structure is a number, return it
        ;Branch-structure can contain another mobile or a number. These lines separate the two mobile
        ;sides and recur until a number is found. The atom? line handles the number case
        ;Add both sides and recur again.
        (else (+ (total-weight (branch-structure (left-branch mobile))) 
                 (total-weight (branch-structure (right-branch mobile)))))))

;I think a trick to figure this out is to imagine the mobiles as a system of nodes or trees. There are two options with nodes, return the leaf or recur on the child node. In this example, it's easier to conceive of a tree, code the appropriate scaffolding, and then tack on the added functionality needed for the selectors.


;Tests
(define br (make-branch 1 2))
(define bl (make-branch 2 4))
(define mob (make-mobile bl br))

(assert (total-weight mob) 6)

(define mob2 (make-mobile (make-branch 3 mob) (make-branch 1 mob)));
(assert (total-weight mob2) 12)

(define mob3 (make-mobile (make-branch 1 mob) (make-branch 1 mob2)))
(assert (total-weight mob3) 18)

;c) Balanced mobile

(define (balanced? mobile)
  (define (subMobile? m)
    (pair? (branch-structure m)))
  (let* ((l (left-branch mobile))
         (r (right-branch mobile))
         (ls (branch-structure l))
         (rs (branch-structure r))
         (ll (branch-length l))
         (rl (branch-length r)))

    (and (if (subMobile? l) (balanced? ls)) 
         (if (subMobile? r) (balanced? rs)) 
         (= (* ll (total-weight ls)) (* rl (total-weight rs))))))


(define mob4 (make-mobile br br))
(assert (balanced? mob4) #t)

(define mob5 (make-mobile (make-branch 3 mob3) (make-branch 3 mob3)))
(assert (balanced? mob5) #f) ;mob3 isn't balanced

(define mob6 (make-mobile (make-branch 6 mob4) (make-branch 6 mob4)))
(assert (balanced? mob6) #t) ;mob4 is balanced

(define mob7 (make-mobile (make-branch 8 mob6) (make-branch 8 mob6)))
(assert (balanced? mob7) #t) ;mob4 is balanced

(define mob8 (make-mobile (make-branch 6 mob3) (make-branch 8 mob6)))
(assert (balanced? mob8) #f)


;d) Representation change

(define (make-mobile left right)
  (cons left right))
(define (make-branch length structure)
  (cons length structure))

;We only need to change the right-branch and branch-structure selectors
;that eliminated the surrounding list from the item
(define (right-branch mobile)
  (cdr mobile))

(define (branch-structure branch)
  (cdr branch))

(define br (make-branch 1 2))
(define bl (make-branch 2 4))
(define mob (make-mobile bl br))

(assert (total-weight mob) 6)

(define mob2 (make-mobile (make-branch 3 mob) (make-branch 1 mob)));
(assert (total-weight mob2) 12)

(define mob3 (make-mobile (make-branch 1 mob) (make-branch 1 mob2)))
(assert (total-weight mob3) 18)
