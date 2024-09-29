(define (average x y) 
  (/ (+ x y) 2))

(define (good-enough guess x)
  (< (abs (- (square guess) x) ) 0.1))

(define (improve-guess guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess x)
  (if (good-enough guess x)
       guess
       (sqrt-iter (improve-guess guess x) x)))

(define (my-sqrt x)
  (sqrt-iter 1 x))


;; ====================
;; === Exercise 1.6 === 
;; ====================

(define (new-if predicate then-clause if-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter-alyssa guess x)
  (new-if (good-enough guess x)
          guess
          (sqrt-iter-alyssa (improve-guess guess x) x)))

;; In the applicative order, you must evaluate arguments of the procedure before applying the procedure.
;; That will cause us to evaluate (sqrt-iter-alyssa (improve-guess guess x) x) infinitely, since
;; there isn't an if to stop us from recursing.

(define (alyssa-sqrt x)
  (sqrt-iter-alyssa 1 x))

;; (alyssa-sqrt 2) ;; -> this recurses infinitely!


;; ====================
;; === Exercise 1.7 ===
;; ====================

;; (my-sqrt 0.0001)    ;; => 0.25 (participation award)
;; (my-sqrt 400000000) ;; takes VERY long

(define (between value lower upper)
  (and (> value lower) (< value upper)))

(define (better-good-enough guess prev-guess)
  (between (/ prev-guess guess) 0.9 1.1))

(define (better-sqrt-iter guess prev-guess x)
  (if (better-good-enough guess prev-guess)
      guess
      (better-sqrt-iter (improve-guess guess x) guess x)))

(define (better-sqrt x)
  (better-sqrt-iter 1 0 x))

(better-sqrt 2.)       ;; => 1.414
(better-sqrt 0.0001)   ;; => 0.01
(better-sqrt 4000000.) ;; => 2000

;; ====================
;; === Exercise 1.8 ===
;; ====================

;; cube root of x, guess y0
;; y1 = ((x / y ^ 2) + 2y) / 3

(define (cbrt-new-guess guess x)
  (/ (+ (/ x (square guess))
        (* 2 guess))
     3))

(define (cbrt-iter guess prev-guess x)
  (if (better-good-enough guess prev-guess)
      guess
      (cbrt-iter (cbrt-new-guess guess x) guess x)))

(define (cbrt x)
  (cbrt-iter 1 0 x))

(cbrt 1.)  ; => 1
(cbrt 8.)  ; => 2.003
(cbrt 27.) ; => 3.001
(cbrt 64.) ; => 4.008
