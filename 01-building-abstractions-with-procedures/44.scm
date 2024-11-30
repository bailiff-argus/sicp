(load "./1.3.4-procedures-as-returned-values.scm")
(load "./43.scm")

(define (smoothed f)
  (define dx 0.000001)
  (lambda (x) (/ (+ (f (- x dx))
                    (f x)
                    (f (+ x dx)))
                 3)))

(define (n-fold-smoothed f dx n)
  (lambda (x) ((repeated smoothed n) f)))
