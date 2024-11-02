(define (divides? a b) (= (remainder b a) 0))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (smallest-divisor n) (find-divisor n 2))

(define (prime? n) (= (smallest-divisor n) n))

(define (even? num)
  (= (remainder num 2) 0))

(define (square x) (* x x))

(define (expmod base e m)
  (cond ((= e 0) 1)
        ((even? e) (remainder
                     (square (expmod base (/ e 2) m))
                     m))
        (else
          (remainder
            (* base (expmod base (- e 1) m))
            m))))

(define (fermat-test n)
  (define (try-it a) (= (expmod a n n ) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false))
  )

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n strt-time)
  (if (fast-prime? n 10)
      (report-prime (- (runtime) strt-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (even? n)
  (= (remainder n 2) 0))

(define (search-for-primes start end num)
  (if (even? start)
    (search-for-primes-be (+ 1 start) end num)
    (search-for-primes-be start end num)))

(define (search-for-primes-be start end num)
  (cond ((or (= num 0) (> start end)))
        ((fast-prime? start 10) (timed-prime-test start) (search-for-primes-be (+ start 2) end (- num 1)))
        (else (search-for-primes-be (+ start 2) end num))))

;; this is basically instant now
(search-for-primes   1000000000   10000000000 3)
(search-for-primes  10000000000  100000000000 3)
(search-for-primes 100000000000 1000000000000 3)
