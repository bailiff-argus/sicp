(load "./1.3.4-procedures-as-returned-values.scm")

(load "./42.scm") ;; compose

;; n'th repeated application of f is f(f(...f(x))), f applied n times

;; for 0 and less repeats, apply 0 times
(define (repeated f times)
  (define (identity x) x)
  (define (repeat cur-func times-left)
    (if (< times-left 1)
        cur-func
        (repeat (compose f cur-func) (- times-left 1))))
  (repeat identity times))

((repeated square 2) 5) ; 625
