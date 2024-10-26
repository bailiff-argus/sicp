;; Idea: (a = a/b + r) => a and b have the same common divisors as b and r
;; Then GCD(a, b) = GCD(b, r). If we do it recursively, when r becomes 0, b is the GCD.

(define (euclid-gcd a b)
  (if (= b 0)  
      a
      (euclid-gcd b (remainder a b))))

;; Lame's theorem: if Euclid's algorithm requires k steps to compute GCD of
;; a pair of numbers, the lesser number must be greater than or equal to
;; the k'th Fibonacci number.
