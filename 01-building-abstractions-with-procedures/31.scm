(load "./1.3.1-procedures-as-arguments.scm")

;; 1.31 Product

(define (rec-product term a next b)
  (if (> a b)
      1
      (* (term a)
         (rec-product term (next a) next b))))

(define (iter-product term a next b)
  (define (iter a result)
    (if (> a b)
         result
         (iter (next a) (* result (term a)))))
  (iter a 1))

(define (factorial-rec  a) (rec-product  identity 1 inc a))
(define (factorial-iter a) (iter-product identity 1 inc a))

(factorial-rec  5) ; 120
(factorial-iter 5) ; 120

(define (pi-approx n)
  (define (term x) (/ (* (dec x) (inc x)) (square x)))
  (define (next x) (+ 2 x))
  (* 4.0 (iter-product term 3 next (+ 3 (* 2 n)))))

;(pi-approx 100000.) ; 3.141600507424168
