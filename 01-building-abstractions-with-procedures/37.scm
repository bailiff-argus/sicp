(load "./1.3.3-procedures-as-general-methods.scm")

;; we can use the top-down approach for the recursive method
(define (cont-frac n d k)
  (define (recurse i)
  (if (= i (+ k 1))
      0
      (/ (n i) (+ (d i) (recurse (+ i 1))))))
  (recurse 1))

;; for the iterative method, we should go bottom-up
(define (cont-frac-it n d k)
  (define (iterate i result)
    (if (= i 0)
        result
        (iterate (- i 1)
                 (/ (n i) (+ (d i) result)))))
  (iterate k 0))

(/ 1 1.6180337185494662) ; .6180340919572921
(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 12)    ; .6180257510729613
(cont-frac-it (lambda (i) 1.0) (lambda (i) 1.0) 12) ; .6180257510729613
