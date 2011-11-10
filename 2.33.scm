(load "myhelpers.scm")

;Set up
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))


;Exercise 2.33

(define (map p sequence)
  (accumulate (lambda (current accumulated-so-far) 
                (cons (p current) accumulated-so-far)); This is very similar to the last line of map
              nil
              sequence))



;Test set up (to test MAP)
;FROM Ex 2.30 -- TO TEST IF MAP WORKS!
(define (square-tree-map tree)
  (map (lambda (sub-tree) 
         (if (atom? sub-tree)
             (square sub-tree)
             (square-tree-map sub-tree)))
       tree))

(define l (list 1
                (list 2 (list 3 4) 5)
                (list 6 7)))

(define answer '(1 (4 (9 16) 25) (36 49)))


;Test
(d 'Map:)
(assert (square-tree-map l) answer)

;Exercise 2.33 (CONTINUED)

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(d 'Append)
(assert (append (list 1 2) (list 3 4)) '(1 2 3 4))

(define (length sequence)
  (accumulate (lambda (bleh accumulated-so-far) ;Bleh is a throw away variable
                (inc accumulated-so-far))
              0
              sequence))
(d 'Length)
(assert (length (list 1 2 3 4)) 4)