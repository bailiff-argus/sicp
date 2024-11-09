(load "./1.3.1-procedures-as-arguments.scm")

(load "./28.scm")
(define (prime? n)
  (precise-prime? n 10))

;; 1.33 Filtered Accumulator

(define (filtered-accumulate combiner null-value term a next b filter)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (if (filter a) (combiner (term a) result)
                             result))))
  (iter a null-value))

(define (any x) #t)

(define (accumulate combiner null-value term a next b)
  (filtered-accumulate combiner null-value term a next b any))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (sum-int a b)
  (sum identity a inc b))

(sum-int 1 10)

(define (sum-prime-squares a b)
  (filtered-accumulate + 0 square a inc b prime?))

(sum-prime-squares 2 7) ; 87


(define (euclid-gcd a b)
  (if (= b 0)  
      a
      (euclid-gcd b (remainder a b))))

(define (prod-all-rel-prime-pos n)
  (define (filter x) (= (euclid-gcd n x) 1))
  (filtered-accumulate * 1 identity 1 inc n filter))

(prod-all-rel-prime-pos 5) ; 24
