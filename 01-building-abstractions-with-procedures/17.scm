(define (even? x)
  (= (remainder x 2) 0))

(define (double x)
  (+ x x))

(define (halve x)
  (/ x 2))

(define (mul a b)
  (if (= b 0)
      0
      (+ a (mul a (- b 1)))))


(define (fast-mul a b)
  ( cond ((= b 0) 0)
         ((even? b) (double (fast-mul a (halve b))))
         (else      (+ a (fast-mul a (- b 1))))))


;; no one's actually gonna be satisfied with a recursive one, though, right? I know I'm not
;; (upd. it was actually ex. 1.18)

(define (fast-mul-i a b)
  (fast-mul-iter a b 0))

(define (fast-mul-iter a n res)
  (cond ((= n 0)   res)
        ((even? n) (fast-mul-iter (double a) (halve n) res))
        (else      (fast-mul-iter a (- n 1) (+ a res)))))


(define (assert_same f1 f2 arg1 arg2)
  (= (f1 arg1 arg2) (f2 arg1 arg2)))

(and
    (assert_same fast-mul-i fast-mul  2  2)
    (assert_same fast-mul-i fast-mul  3  3)
    (assert_same fast-mul-i fast-mul  4  4)
    (assert_same fast-mul-i fast-mul  5  5)
    (assert_same fast-mul-i fast-mul  6  6)
    (assert_same fast-mul-i fast-mul  7  7)
    (assert_same fast-mul-i fast-mul  8  8)
    (assert_same fast-mul-i fast-mul  9  9)
    (assert_same fast-mul-i fast-mul 10 10))
