(load "./1.3.1-procedures-as-arguments.scm")

;; 1.32 Accumulator
;; (accumulate combiner null-value term a next b)

(define 
  (accumulate-rec combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

(define
  (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner (term a) result))))
  (iter a null-value))

(define (a-sum term a next b)
  (accumulate-iter + 0 term a next b))

(define (a-prod term a next b)
  (accumulate-iter * 1 term a next b))

(a-sum identity 1 inc 10) ; 55
(a-prod identity 1 inc 5) ; 120
