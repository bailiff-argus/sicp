;; Find smallest divisor by going through each number up to sqrt(n) from 2

(define (smallest-divisor n) (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b) (= (remainder b a) 0))

;; If the number's smallest divisor is itself, then it's prime

(define (prime? n) (= (smallest-divisor n) n))

(define (even? num)
  (= (remainder num 2) 0))

(define (square x) (* x x))

;; Fermat's Little Theorem:
;;   If n is prime, and a is a positive integer less than n,
;;   then a^n is congruent to a % n.

;; Congruency modulo n:
;;   Numbers are 'congruent modulo n' if they have the equal
;;   remainders when divided by n.

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
        (else false)))


(define (full-fermat-backend n cur)
  (if (< cur n) (and (= (expmod cur n n) cur) (full-fermat-backend n (+ 1 cur)))
                #t))

(define (full-fermat n)
  (full-fermat-backend n 2))

(and (full-fermat 561)
     (full-fermat 1105)
     (full-fermat 1729)
     (full-fermat 2465)
     (full-fermat 2821)
     (full-fermat 6601))
