#lang racket

(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))

;Picture language extension
;See http://planet.plt-scheme.org/package-source/soegaard/sicp.plt/2/1/planet-docs/sicp-manual/index.html
;Make sure enable 'Determine Language from source'

;See http://www.billthelizard.com/2011/08/sicp-244-245-picture-language.html for a good guide

;Setup
(define (right-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (right-split painter (- n 1))))
        (beside painter (below smaller smaller)))))

;Ex 2.44
(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter (- n 1))))
        (below painter (beside smaller smaller) ))))

;Test
(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1 )))
            (right (right-split painter (- n 1))))
        (let ((top-left (beside up up))
              (bottom-right (below right right)))
          (below (beside painter bottom-right)
                 (beside top-left (corner-split painter (- n 1))))))))

(paint (corner-split einstein 4 ))