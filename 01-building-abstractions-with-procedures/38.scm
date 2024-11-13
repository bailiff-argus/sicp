(load "./1.3.3-procedures-as-general-methods.scm")
(load "./37.scm")

(define (n_i i) 1.0)

(define (d_i i)
  (if (= (remainder i 3) 2)
    (* 2 (/ (+ i 1) 3))
    1))

(cont-frac-it n_i euler-d_i 100) ; .7182818284590453
