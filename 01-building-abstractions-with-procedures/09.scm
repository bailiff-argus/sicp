(define (+ a b)
  (if (= a 0) b (inc (+ (dec a) b))))

;; This approach will create a linear recursive process, since the tail of increments
;; will not disappear until the a=0 stage is reached, and only then will the process
;; start evaluating.
  (inc (+ (dec 3) 3))
  (inc (inc (+ (dec 2) 3)))
  (inc (inc (inc (+ (dec 1) 3))))
  (inc (inc (inc 3)))
  (inc (inc 4))
  (inc 5)
  (6)
  


(define (+ a b)
  (if (= a 0) b (+ (dec a) (inc b))))

;; This approach will create a linear iterative process, since the new call of (+)
;; can fully describe the state.
  (+ (dec 3) (inc 3))
  (+ (dec 2) (inc 4))
  (+ (dec 1) (inc 5))
  (+ 0 6)
  (6)
