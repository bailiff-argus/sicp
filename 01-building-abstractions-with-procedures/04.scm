(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b ))

;; if b > 0, we use +, meaning we calculate a + b
;; if b < 0, we use -, a - b with b < 0 is the same as a + |b|
;; with b = 0, sign is irrelevant
