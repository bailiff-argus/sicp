(load "./1.3.3-procedures-as-general-methods.scm")

(define (inc x) (+ x 1))

;; average damping as a procedure
(define (average-damp f)
  (lambda (x) (average x (f x))))

((average-damp square) 10) ; 55

(define (sqrt x)
  (fixed-point (average-damp (lambda (y) (/ x y)))
               1.0))

(define (cube-root x)
  (fixed-point (average-damp (lambda (y) (/ x (square y))))
               1.0))

(sqrt 9) ; 3.
(cube-root 27) ; 2.9999998270063113


;; Newton's Method
;; If [ x -> g(x) ] is a differentiable function, then a solution of the equation g(x) = 0
;; is a fixed point of the function [ x -> f(x) ], where f(x) = x - g(x) / (Dg(x)),
;; and Dg(x) is the derivative of g evaluated at x.

(define (deriv g)
  (lambda (x) (/ (- (g (+ x dx))
                    (g x))
                 dx)))
(define dx 0.000001)

(define cube (lambda (x) (* x x x)))
((deriv cube) 5) ; 75.00001501625775

(define (newton-transform g) ;; => f(x)
  (lambda (x) (- x
                 (/ (g x)
                    ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

;; x -> sqrt(x)
;; y^2 = x => g(y) = y^2 - x = 0
;; x -> f(x), f(x) = x - g(x) / Dg(x)

(define (sqrt x)
  (newtons-method
    (lambda (y) (- (square y) x)) 1.0))

;; Abstractions and first-class procedures

;; Both the fixed-point square root calculation and the Newton's method calculation
;; find the fixed point of some transformation of a function. Which means we can
;; generalize again:

(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))


;; For the case where we search the fixed point of the mapping [ y -> x/y ],
;; it can be expressed as follows:

(define (sqrt x)
  (fixed-point-of-transform (lambda (y) (/ x y))
                            average-damp
                            1.0))

(sqrt 4) ; 2.0000000000000253

;; For the case of using the Newton's method, we look for a zero of f(y) = y^2 - x;
(define (sqrt x)
  (fixed-point-of-transform (lambda (y) (- (square y) x))
                            newton-transform
                            1.0))

(sqrt 4) ; 2.0000000000000253

;; Elements are FIRST CLASS, if:
;; - they may be named by variables,
;; - they may be passed as arguments to procedures,
;; - they may be returned as the results of procedures,
;; - they may be included in data structures.
