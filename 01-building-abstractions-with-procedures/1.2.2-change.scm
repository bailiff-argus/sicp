(define (count-change amount) (cc amount 5))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination kinds-of-coins))
                     kinds-of-coins)))))

;; (cc 10 2)
;; => (+ (cc 10 1) (cc (- 10 5) 2))
;; => (+ (cc 10 1) (cc 5 2))
;; (cc 10 1) => (+ (cc 10 0) (cc 9 1)) => 1
;; (cc 5 2) => (+ (cc 5 1) (cc 0 2)) => (+ (1) (1)) => 2
;; => 3

(count-change 100) ; 292
