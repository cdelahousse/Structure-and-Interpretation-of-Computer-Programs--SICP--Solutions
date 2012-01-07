(load "myhelpers.scm")
;Exercise 2.36

;Set up
(define (dot-product v w)
  (accumulate + 0 (map * v w)))

;Test
(define v1 '(1 2 3 4)) ;4-vector

(assert (dot-product v1 v1) 30)


(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))


;Answers

;Matrix vector multiplication
(define (matrix-*-vector m v)
  (map (lambda (row-vector)
         (dot-product v row-vector))
       m))

;Test
(define m1 '((1 2 3 4) (4 5 6 6) (6 7 8 9))) ;3x4 = mxn

(assert (matrix-*-vector m1 v1) '(30 56 80))

;Transpose
(define (transpose mat)
  (accumulate-n cons '() mat))

;Test
(assert (transpose m1) '((1 4 6) (2 5 7) (3 6 8) (4 6 9)))

;
;Matrix multiplicaton
(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (r) 
           (accumulate (lambda (c matrix-so-far)
                         (cons (dot-product r c)
                               matrix-so-far))
                       '()
                       cols))
         m)))



;Test
(define m2 '((1 2 3) (1 2 3) (1 2 3)))
(d (matrix-*-matrix m2 m2))

(define m3 '((1 1) (1 1) (1 1)))
(d (matrix-*-matrix m2 m3))



;Other implementations of matrix-*-matrix
(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (r)  
           (map (lambda (c) ;Map builds the list, no need for accumulate
                  (dot-product r c))
                cols))
         m)))

;Test
(d "Other implementations")
(assert (matrix-*-matrix m2 m2) '((6 12 18) (6 12 18) (6 12 18)))
(assert  (matrix-*-matrix m2 m3) '((6 6) (6 6) (6 6)))

;With every row of the first matrix, we multiply it with the second matrix.
;Exactly like matrix multiplied by a vector (matrix-*-vector). So, to simplify
;even more...
(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (row) (matrix-*-vector cols row)) m)))

;Test
(assert (matrix-*-matrix m2 m2) '((6 12 18) (6 12 18) (6 12 18)))
(assert  (matrix-*-matrix m2 m3) '((6 6) (6 6) (6 6)))