(define (square x)
  (* x x))

;; Naive implementation: multiply continuosly
;; b^n = { b * b^(n-1) if n > 0
;;       { 1           if n == 0

;; recursive
(define (expt b n)
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))

;; iterative
(define (expt-iter-inner b counter product)
  (if (= counter 0)
      product
      (expt-iter-inner b
                       (- counter 1)
                       (* product b))))

(define (expt-iter b n)
  (expt-iter-inner b n 1))

;; Even powers can be turned into squares of their halves
;;       { if n == 0          1
;; b^n = { if (n % 2 == 0)   (b^(n/2))^2
;;       { if (n % 2 == 1)    b * b^(n-1)

(define (even? num)
  (= (remainder num 2) 0))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (assert_same f1 f2 arg1 arg2)
  (= (f1 arg1 arg2) (f2 arg1 arg2)))

(and
    (assert_same expt-iter fast-expt  2  2)
    (assert_same expt-iter fast-expt  3  3)
    (assert_same expt-iter fast-expt  4  4)
    (assert_same expt-iter fast-expt  5  5)
    (assert_same expt-iter fast-expt  6  6)
    (assert_same expt-iter fast-expt  7  7)
    (assert_same expt-iter fast-expt  8  8)
    (assert_same expt-iter fast-expt  9  9)
    (assert_same expt-iter fast-expt 10 10))
