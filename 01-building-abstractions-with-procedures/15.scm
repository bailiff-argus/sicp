;; sin x = 3 sin(x/3) - 4 sin3(x/3)
;; angle <= 0.1 => sin x = x

(define (cube x) (* x x x))

(define (p x) (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

;; A. 5
;; B. a / (3^n) < 0.1 => (a / 0.1) < 3^n => log(a) - log(0.1) < n log(3) => (log(a) - log(0.1)) / log(3) < n => O(log n)
