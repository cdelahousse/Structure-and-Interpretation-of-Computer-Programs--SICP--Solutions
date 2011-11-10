(load "myhelpers.scm")

;Set up
(define (enumerate-tree tree)
  (cond ((null? tree) '())
        ((atom? tree) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))

;Exercise 2.35
(define (count-leaves t)
  (accumulate + ;add up numbers of lengths
              0 
              (map (lambda (tree)
                     (length (enumerate-tree tree))) ;Find length of every subtree
                   t)))

(define testval (list 'a (list 'b 'c 'd 'e) 'f (list 'g 'h (list 'i (list 'j 'k) 'l))))

(d (map (lambda (tree) (length (enumerate-tree tree))) testval))
(assert (count-leaves testval) 12)

;Another implementation
(define (count-leaves t)
  (accumulate + ;Add up all the 1s from the flat list
              0
              (map (lambda (tree) 1) ;convert every flat list item to 1
                   (enumerate-tree t))));Flatten list and feed it to map

(assert (count-leaves testval) 12)

;There's an awsome completely recursive answer that doesn't use enumerate tree:
;http://community.schemewiki.org/?sicp-ex-2.35