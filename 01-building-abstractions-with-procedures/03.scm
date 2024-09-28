(define (square x) (* x x))
(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (square-largest-two a b c)
    (if (> a b)
      (if (> c b) (sum-of-squares a c) (sum-of-squares a b))
      (if (> c a) (sum-of-squares b c) (sum-of-squares b a))))
