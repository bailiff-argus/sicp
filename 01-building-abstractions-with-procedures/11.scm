;; f(n) = 
;;        n  < 3 => n
;;        n >= 3 => f(n-1) + 2f(n-2) + 3f(n-3)

(define (f-rec n)
  (if (< n 3) 
     n
     (+ (f-rec (- n 1))
        (* 2 (f-rec (- n 2)))
        (* 3 (f-rec (- n 3))))))

(define (f n)
  (f-iter 0 -1 -2 n))

;; fn  = f(n)
;; fn1 = f(n - 1)
;; fn2 = f(n - 2)
;; use count as a measure of the amount of increases of n left
(define (f-iter fn fn1 fn2 count)
  (if (<= count 0)
      fn
      (f-iter (if (< fn 2) (+ fn 1) (+ fn (* 2 fn1) (* 3 fn2)))
              fn
              fn1
              (- count 1))))


(define (assert_same f1 f2 arg)
  (= (f1 arg) (f2 arg)))

(and
  (assert_same f-rec f 1)
  (assert_same f-rec f 2)
  (assert_same f-rec f 3)
  (assert_same f-rec f 4)
  (assert_same f-rec f 5)
  (assert_same f-rec f 6)
  (assert_same f-rec f 7)
  (assert_same f-rec f 8)
  (assert_same f-rec f 9)
  (assert_same f-rec f 10)
  (assert_same f-rec f 11))
