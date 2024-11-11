(define (f g) (g 2))

(f square) ; 4

(f (lambda (z) (* z (+ z 1)))) ; 6

(f f) ; the object 2 is not applicable
;; (f f) => (f 2) => (2 2). 2 is not an operator, so we get this error
