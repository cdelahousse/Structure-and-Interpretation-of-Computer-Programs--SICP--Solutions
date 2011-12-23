(load "myhelpers.scm")

;Exercise 2.41
;Based on unique-pairs from previous question
(define (unique-triples n)
  (flatmap (lambda (i) ;Flatmap because we take the list of lists from line #2 and append it to the master list
             (flatmap (lambda (j) ;#2 Use flatmap b/c we create a list of (i j k) permuations from line #4
                        (map (lambda (k) ;#3 No flatmap because we're not accumlating lists. Here we're creating them for every int from 1 to (- j 1). We create a list from every enumeration.
                               (list i j k)) ;#4 Creates a list for every int from 1 to j.
                             (enumerate-interval 1 (- j 1))))
                      (enumerate-interval 1 (- i 1))))
             (enumerate-interval 1 n)))
;Test
(d (unique-triples 5))

(define (match-sum-triples n s)
	(filter (lambda (triple)
                  (let ((sum (accumulate + 0 triple)))
                    (= sum s)))
                (unique-triples n)))

;Test
(assert (match-sum-triples 5 8) '((4 3 1) (5 2 1)))

(d (match-sum-triples 5 9))
(d (match-sum-triples 6 10))

;Beautiful Solution:
;http://community.schemewiki.org/?sicp-ex-2.41