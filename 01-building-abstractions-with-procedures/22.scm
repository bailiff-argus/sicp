;; Find smallest divisor by going through each number up to sqrt(n) from 2

(define (divides? a b) (= (remainder b a) 0))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (smallest-divisor n) (find-divisor n 2))

;; If the number's smallest divisor is itself, then it's prime

(define (prime? n) (= (smallest-divisor n) n))

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
        ;; this is a bit of a crutch, but timed-prime-test doesn't return true/false, 
        ;; and we have to check somehow to count exactly 3 primes
        ((prime? start) (timed-prime-test start) (search-for-primes-be (+ start 2) end (- num 1)))
        (else (search-for-primes-be (+ start 2) end num))))

;; these are a bit too quick
(search-for-primes   1000   10000 3)
(search-for-primes  10000  100000 3)
(search-for-primes 100000 1000000 3)

;; follows sqrt(n) pretty well!
(search-for-primes   1000000000   10000000000 3)
(search-for-primes  10000000000  100000000000 3)
(search-for-primes 100000000000 1000000000000 3)
