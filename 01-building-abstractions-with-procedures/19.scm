;; I won't be writing the proof here, but it's really straightforward,
;; so just grab a piece of paper and go through the motions.

(define (square x)
  (* x x))

(define (square-p p q)
  (+ (square p) (square q) ))

(define (square-q p q)
  (+ (square q) (* 2 p q)))


(define (even? num)
  (= (remainder num 2) 0))

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count) (fib-iter a
                                 b
                                 (square-p p q)
                                 (square-q p q)
                                 (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

(and
  (= (fib 1)    1)
  (= (fib 2)    1)
  (= (fib 3)    2)
  (= (fib 4)    3)
  (= (fib 5)    5)
  (= (fib 6)    8)
  (= (fib 7)   13)
  (= (fib 8)   21)
  (= (fib 9)   34)
  (= (fib 10)  55)
  (= (fib 11)  89)
  (= (fib 12) 144)
  (= (fib 13) 233))
