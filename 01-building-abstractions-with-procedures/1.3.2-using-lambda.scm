(load "./1.3.1-procedures-as-arguments.scm")

(lambda (x) (+ x 4))

(lambda (x) (/ 1.0 (* x (+ x 2))))

(define (pi-sum a b)
  (sum (lambda (x) (/ 1.0 (* x (+ x 2))))
       a
       (lambda (x) (+ x 4))
       b))

(define (integral f a b dx)
  (* (sum f
          (+ a (/ dx 2.0))
          (lambda (x) (+ x dx))
          b))
     dx)

;; these are equivalent
(define (plus4 x) (+ x 4))
(define plus4 (lambda (x) (+ x 4)))

;; f(x, y) = x(1 + xy)^2 + y(1 - y) + (1 + xy)(1 - y)
;;
;; a = 1 + xy
;; b = 1 - y
;; f(x, y) = xa^2 + yb + ab

(define (f x y)
  (define (f-helper a b)
    (+ (* x (square a))
       (* y b)
       (* a b)))
  (f-helper (+ 1 (* x y)) (- 1 y)))

;; we can use lambda insted of defining
(define (f x y)
  ((lambda (a b)
     (+ (* x (square a))
        (* y b)
        (* a b)))
   (+ 1 (* x y))
   (- 1 y)))

;; this approach is aliased with 'let'
(define (f x y)
  (let ((a (+ 1 (* x y)))
        (b (- 1 y))
    (+ (* x (square a))
       (* y b)
       (* a b))))

;; let is bound locally
;; variable values are computed outside of let

;; due to yet unknown evaluation subtleties, this is not the same as let
(define (f x y)
  (define a (+ 1 (* x y)))
  (define b (- 1 y))
  (+ (* x (square a))
     (* y b)
     (* a b)))
