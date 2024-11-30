(load "./1.3.4-procedures-as-returned-values.scm")

;; f(x), g(x)
;; the composition (f after g) is x -> f(g(x))

(define (compose f g)
  (lambda (x) (f (g x))))

((compose square inc) 6) ; 49
