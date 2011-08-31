(load "2.2.scm")

(define (dbl n) (* n 2)) ;Helper 

;Defining parameter and area function so that the results can 
;be evaluated in terms of rectangle selectors.
;Using selectors means the implementation can change
(define (rect-param rect)
  (+ (dbl (rect-length rect))
     (dbl (rect-width rect))))

(define (rect-area rect)
  (+ (rect-length rect)
     (rect-width rect)))


;Representation 1 -> segment (2 points) as opposite points of a rectange
;(define (segment-length s)
;  (let ((s1 (start-segment s))
;        (s2 (end-segment s)))
;    (sqr (abs (s2-

(define (make-rect-seg s)
  s)
(define rect-origin start-segment)
(define rect-opp-origin end-segment)

(define (rect-length rect)
 (let ((p1 (rect-origin rect))
       (p2 (rect-opp-origin rect)))
   (abs (- (x-point p1) (x-point p2))))) 
(define (rect-width rect)
 (let ((p1 (rect-origin rect))
       (p2 (rect-opp-origin rect)))
   (abs (- (y-point p1) (y-point p2)))))

;Test representation 1
(newline)
(display "Test representation 1")
(newline)
(let ((r (make-rect-seg (make-segment (make-point -2.35 -3.5) (make-point 4 5)))))
  (display r)
  (newline)
  (display (rect-length r))
  (newline)
  (display (rect-width r))
  (newline)
  (display (rect-param r))
  (newline)
  (display (rect-area r))
  )

;Representation 2 - length and height with an origin of 0.0 and positive integers... hehehe.. easy
(define (make-rect-sides l w)
   (cons (make-point 0 0) (cons (abs l) (abs w))))

(define (rect-length rect)
  (car (cdr rect)))

(define (rect-width rect)
  (cdr (cdr rect)))

;Test rep 2
(newline)
(display "Test representation e")
(newline)
(let ((r (make-rect-sides 4 3)))
  (display r)
  (newline)
  (display (rect-length r))
  (newline)
  (display (rect-width r))
  (newline)
  (display (rect-param r))
  (newline)
  (display (rect-area r))
  )

; I know the last representation was a bit cheap, but it shows that different representations make know difference when we abstract away most of the procedures.  