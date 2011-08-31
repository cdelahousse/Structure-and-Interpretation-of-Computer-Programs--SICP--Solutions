;My answer

(define new-make-rat
  (lambda (n d) 
    (let ((n (if (eq? (abs d) d)
                n
                (- n)))
          (d (abs d)))
      (cons n d))))
;Test
(new-make-rat -3 -3)
(new-make-rat -3 3)
(new-make-rat 3 -3)
;Better answer from Scheme Wiki
(define (make-rat n d)
   (let ((g ((if (< d 0) - +) (gcd n d))))
     (cons (/ n g) (/ d g))))

;evaluates the operator before associating the data to g (of let). Scheme evaluates the operator before anything else