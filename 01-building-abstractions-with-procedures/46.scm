(load "./1.3.4-procedures-as-returned-values.scm")

(define (iterative-improve good-enough? improve)
  (define (try-guess guess)
    (if (good-enough? guess)
        guess
        (try-guess (improve guess))))
  try-guess)


(define (sqrt-iter guess x)
  (define tolerance 0.00001)

  (define (good-enough? guess)
    (< (abs (- (square guess) x)) tolerance))

  (define (improve guess)
    (average guess (/ x guess)))

  ((iterative-improve good-enough? improve) guess))

(sqrt-iter 1.0 4.0) ; 2.0000000929222947


(define (fixed-point f first-guess)
  (define tolerance 0.000001)

  (define (good-enough? guess)
    (< (abs (- guess (f guess))) tolerance))

  (define (improve guess) (f guess))

  ;; this is a bit unfortunate, since we want to return the 'next' value,
  ;; and not the previous one. We can alternatively edit iterative-improve
  ;; to handle arguments a little differently, but I assume that this is 
  ;; what was intended.
  ((iterative-improve good-enough? improve) first-guess))

(fixed-point cos 1.0) ; .7390845495752126
(fixed-point (lambda (y) (+ (cos y) (sin y))) 1.0) ; 1.2587287680106494
