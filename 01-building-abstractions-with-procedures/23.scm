(define (divides? a b) (= (remainder b a) 0))

(define (next-divisor prev-div)
  (if (= prev-div 2) 3
                     (+ prev-div 2)))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next-divisor test-divisor)))))

(define (find-divisor-old n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor-old n (+ test-divisor 1)))))

(define (smallest-divisor n) (find-divisor n 2))
(define (smallest-divisor-old n) (find-divisor-old n 2))

;(define (prime? n) (= (smallest-divisor n) n))
(define (prime? n) (= (smallest-divisor-old n) n))

(define (even? num)
  (= (remainder num 2) 0))

(define (square x) (* x x))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n strt-time)
  (if (prime? n)
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
        ((prime? start) (timed-prime-test start) (search-for-primes-be (+ start 2) end (- num 1)))
        (else (search-for-primes-be (+ start 2) end num))))

;; The ratio is about 1.6, likely source of performance loss is the conditional
(search-for-primes   1000000000   10000000000 3)
(search-for-primes  10000000000  100000000000 3)
(search-for-primes 100000000000 1000000000000 3)
