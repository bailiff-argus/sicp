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

;; Miller-Rabin test
;;   If n is prime, and a is any positive integer less than n,
;;   then a^(n-1) is congruent to 1 modulo n.


;; If there's ever a nontrivial (not 1 or n-1) square root of 1 modulo n,
;; then the number is not prime.

(define (mr-square num n)
  (define (triv? x) (or (= x (- n 1)) (= x 1)))
  (define (sqrt-1-modn? x) (= (remainder (square x) n) 1))
  (cond ((triv? num) (square num))
        ((sqrt-1-modn? num) 0)
        (else (square num))))

(define (mr-expmod base e n)
  (cond ((= e 0) 1)
        ((even? e) (remainder 
                     (mr-square (mr-expmod base (/ e 2) n) n)
                     n))
        (else (remainder
                (* base (mr-expmod base (- e 1) n))
                n))))

(define (mr-test n)
  (define (try-it a) (= (mr-expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

(define (precise-prime? n times)
  (cond ((= times 0) true)
        ((mr-test n) (precise-prime? n (- times 1)))
        (else false)))

(fast-prime? 1999 10)    ; #t
(precise-prime? 1999 10) ; #t

;; Carmichael numbers: the ones that fool the Fermat test
(precise-prime? 561 10)  ; #f
(precise-prime? 1105 10) ; #f
(precise-prime? 1729 10) ; #f
(precise-prime? 2465 10) ; #f
(precise-prime? 2821 10) ; #f
(precise-prime? 6601 10) ; #f

(fast-prime? 561 10)   ; #t
(fast-prime? 1105 10)  ; #t
(fast-prime? 1729 10)  ; #t
(fast-prime? 2465 10)  ; #t
(fast-prime? 2821 10)  ; #t
(fast-prime? 6601 10)  ; #t
