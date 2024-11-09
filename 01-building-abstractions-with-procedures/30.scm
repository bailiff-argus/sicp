(load "./1.3.1-procedures-as-arguments.scm")


;; 1.30 Iterative sum

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))
