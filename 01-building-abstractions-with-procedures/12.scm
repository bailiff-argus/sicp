;; we're beginning the enumeration from line 0, element 0
(define (pascal-num row el)
  (cond ((or (< row 0) (< el 0)) 0) ;; this is out of bounds
        ((or (= el 0) (= el row)) 1)
        (else  (+ (pascal-num (- row 1) el) (pascal-num (- row 1) (- el 1)) ))
        ))

(and (= (pascal-num 0 0)  1)
     (= (pascal-num 1 0)  1)
     (= (pascal-num 1 1)  1)
     (= (pascal-num 2 1)  2)
     (= (pascal-num 3 1)  3)
     (= (pascal-num 4 2)  6)
     (= (pascal-num 5 2) 10))
