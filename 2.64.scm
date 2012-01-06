
(define (list->tree elements)
  (car (partial-tree elements (length elements))))

;Note: '(entry left-branch right-branch) is the representation used for binary trees

;Partial-tree is a recursive procedure that returns '(constructed-tree remaining-items-list)
;With every call, partial tree divides an ordered list into three components
;(left-items middle-item right-items) or (items-to-[[n-1]/2]  item[n/2] items-from-[[n+1]/2])
;In the function's last call, a tree is built with the above items.


(define (partial-tree elts n)
  (if (= n 0) ;Base case
      (cons '() elts) ; Returns unused elements, unchanged
      ;ELSE
      (let ((left-size (quotient (- n 1) 2))) ;
        ;Processing left elements
        (let ((left-result (partial-tree elts left-size)))
          ;Building left branch...
          (let ((left-tree (car left-result))
                (non-left-elts (cdr left-result))
                ;right size as item after n/2 until the end
                (right-size (- n (+ left-size 1))))
            (let ((this-entry (car non-left-elts))
                  ;Processing ites that'll make up the right branch
                  ;Cdr of non-left-elts b/c the car is the middle entry
                  (right-result (partial-tree (cdr non-left-elts)
                                              right-size)))
              (let ((right-tree (car right-result))
                    (remaining-elts (cdr right-result)))
                ;Combine right and left tree
                ;Return combined tree and remaining elements
                (cons (make-tree this-entry left-tree right-tree)
                      remaining-elts))))))))
