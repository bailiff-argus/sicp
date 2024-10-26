(define (fast-mul-i a b)
  (fast-mul-iter a b 0))

(define (fast-mul-iter a n res)
  (cond ((= n 0)   res)
        ((even? n) (fast-mul-iter (double a) (halve n) res))
        (else      (fast-mul-iter a (- n 1) (+ a res)))))

