(load "./1.3.4-procedures-as-returned-values.scm")
(load "./16.scm") ;; fast-expt-i
(load "./43.scm") ;; repeat

;; convergence of nth root search

;; y -> x/y does not converge:
;; 1. f(y) = x/y; y2 = x/y
;; 2. f(x/y) = x / (x/y) = y; y3 = y
;; ...and this goes on forever

;; Average-damped y -> x/y works, but doesn't for cube roots (y -> x/y^2)

(define (pow x n)
  (fast-expt-i x n))

;; n-th root => create map [ y -> x / (y ^ (n - 1)) ]
(define (n-root-map x n)
  (lambda (y) (/ x (pow y (- n 1)))))

(define (nth-root x n damp-degree)
  (fixed-point ((repeated average-damp damp-degree) (n-root-map x n)) 1.0))

(define (sqrt x)
  (nth-root x 2 1))

(sqrt 4) ; 2.000000000000002

(define (cubert x)
  (nth-root x 3 1))

(cubert 10)

(define (quadrt x)
  (nth-root x 4 2))

(quadrt 81)

(define (10-rt x)
  (nth-root x 10 3))

(10-rt 1024)

(define (100-rt x)
  (nth-root x 100 6))

(define (128-rt x)
  (nth-root x 128 7))

(128-rt (pow 2 128))

;; for an n-th root, the degree of average damping must be the closest
;; power of 2 to n from below, e.g. 64 for 127, 128 for 128.

(define (log_n base num)
  (/ (log num) (log base)))

(define (round-down num)
  (let ((rounded (round num)))
    (if (> rounded num)
        (- rounded 1)
        rounded)))

(define (nth-root x n)
  (define (damping-degree-for-nth-root n)
    (round-down (log_n 2 n)))
  (fixed-point ((repeated average-damp (damping-degree-for-nth-root n)) (n-root-map x n))
               1.0))

(nth-root (pow 3 128) 128) ; 3.0000000000000004
