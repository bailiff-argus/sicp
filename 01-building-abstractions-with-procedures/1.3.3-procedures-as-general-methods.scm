;; Half-interval method
;; For a continuous function f(x), for any (a, b): (f(a) < 0 && f(b) > 0) exists at least one x: (a < x < b), such that f(x) = 0;

(define (average a b) (/ (+ a b) 2))

(define (close-enough? x y) (< (abs (- x y)) 0.0001))

(define (search f neg-point pos-point)
  (let ((midpoint (average neg-point pos-point)))
    (if (close-enough? neg-point pos-point)
        midpoint
        (let ((test-value (f midpoint)))
          (cond ((positive? test-value) (search f neg-point midpoint))
                ((negative? test-value) (search f midpoint pos-point))
                (else midpoint))))))

(define (half-interval-method f a b)
  (let ((a-value (f a)) (b-value (f b)))
    (cond ((and (negative? a-value) (positive? b-value)) (search f a b))
          ((and (negative? b-value) (positive? a-value)) (search f b a))
          (else (error "Values are not of the opposite sign:" a b)))))

;; approximating pi
(half-interval-method sin 2.0 4.0) ; 3.141571044921875

;; solving x3 - 2x - 3 = 0 between 1 and 2
(half-interval-method (lambda (x) (- (* x x x) (* 2 x) 3))
                      1.0
                      2.0) ; 1.893280029296875

;; Finding fixed points of functions
;; x is a fixed point of f, if f(x) = x.
;; The procedure we will use for that is to continuously apply
;; f(x) to the result until it stops changing much.
;; f(x), f(f(x)), f(f(f(x))), ...

(define tolerance 0.000001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))

  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))

  (try first-guess))

(fixed-point cos 1.0) ; .7390822985224024

(fixed-point (lambda (y) (+ (cos y) (sin y))) 1.0) ; 1.2587315962971173

;; average damping
(define (sqrt x)
  (fixed-point (lambda (y) (average y (/ x y)))
               1.0))

(sqrt 2)
