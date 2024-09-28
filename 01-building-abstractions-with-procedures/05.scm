(define (p) (p))
(define (test x y)
  (if (= x y) 0 y))

;; the order is normal, if at first a full expansion is conducted, and then the result is reduced
;; the order is applicative, the operator and the operands are evaluated first, and then the procedure is applied

(test 0 (p))
;; in the case of applicative order, p evaluation is going to recurse infinitely
;; in the case of normal order, full expansion is going to lead to (if (= 0 0) 0 p), and the result is going to be 0
