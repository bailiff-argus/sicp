(load "./1.3.4-procedures-as-returned-values.scm")

(define (inc x) (+ 1 x))

(define (double g)
  (lambda (x) (g (g x))))

;; (double double) -> (double (double g))
;; (double (double double)) -> ((double double) ((double double) g))
;; -> (double (dobule (double (double g)))) -> 2^4 = 16 times

(((double (double double)) inc) 5) ; 21
