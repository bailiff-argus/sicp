(load "./1.3.3-procedures-as-general-methods.scm")
(load "./37.scm")

(define (square x) (* x x))

(define (tan-cf x k)
  (define (n_i i) (if (= i 1) x (* -1 x x)))
  (define (d_i i) (- (* 2 i) 1))
  (cont-frac-it n_i d_i k)
)

(tan-cf 0.7 10) ; .8422883804630793
(tan 0.7)       ; .8422883804630794

(tan-cf 1.1 10) ; 1.9647596572486525
(tan 1.1)       ; 1.9647596572486523
