(load "./1.3.4-procedures-as-returned-values.scm")

(define (square x) (* x x))
(define (cube x) (* x x x))

;; this must create an [x -> x^3 + ax^2 + bx + c]
(define (cubic a b c)
  (lambda (x) (+ (cube x)
                 (* a (square x))
                 (* b x)
                 c)))

(newtons-method (cubic 0 0 0) 1)  ; 2.427970537436266e-6
(newtons-method (cubic 0 0 1) 1)  ; -.9999999999999982
(newtons-method (cubic 0 0 27) 1) ; -2.9999999999999982
