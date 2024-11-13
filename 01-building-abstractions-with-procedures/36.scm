(load "./1.3.3-procedures-as-general-methods.scm")


(define (fixed-point f first-guess)

  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))

  (define (try guess)
    (display guess)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (average-damp f x) (average x (f x)))

(define (f x) (/ (log 1000) (log x)))
(define (adf x) (average-damp f x))

(display "normal:")
(newline)
(fixed-point f 2.0)
(display "now ad:")
(newline)
(fixed-point adf 2.0)
