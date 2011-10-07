(load "myhelpers.scm")

(define (pascal row col)
  (cond ((= row 1) 1) ;Basecase/terminal condition
        ((= col 1) 1) ;ditto
        ((= col row) 1) ;ditto
        (else (+ (pascal (dec row) col)
                 (pascal (dec row) (dec col))))))
;Test
;(if (= (pascal 3 2) 2)
;   (d 'yeah)
;   (d 'naw))

(assert (pascal 3 2) 2) ;Row 3, Col 2 = 2
(assert (pascal 5 2) 4) ;Row 4, col 2 = 4
(assert (pascal 5 3) 6) ; = 6
(assert (pascal 5 4) 4)
(assert (pascal 5 5) 1)
(assert (pascal 14 3) 78)
(assert (pascal 14 7) 1716)

(pascal 6 4)
(pascal 1 1)
(pascal 10 2)
(pascal 14 3)
(pascal 14 7)

;The trick is to perceive the problem as 'Pascal's leaning triangle' or 'Pacal's right triangle.' Building the triangle out from one side helps with the conception of the problem. For ex:
;1
;1 1
;1 2 1
;1 3 3 1
;1 4 6 4 1

;So now, it's much easier to imagine the core of the program:
;(pascal row col) == (+ (pascal (- row 1) col) (pascal (- row 1) (- col 1)))
;Basically, the pascal number (row, col) is that of the number above it (row - 1, col)  and the one above and behind it (row - 1, col - 1)