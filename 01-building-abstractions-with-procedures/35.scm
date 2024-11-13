;; The golden ratio phi is defined as the solution to phi^2 = phi + 1.
;; phi = 0 is not the root of the equation.
;; If we divide both sides by phi, we get
;;   phi = 1 + 1 / phi.
;; This is a fixed-point problem for f(x) = 1 + 1/x

(load "./1.3.3-procedures-as-general-methods.scm")

;; without average damping
(fixed-point (lambda (x) (+ 1 (/ 1 x)))
             1.0) ; 1.6180327868852458

;; with average damping
(fixed-point (lambda (x) (average x(+ 1 (/ 1 x))))
             1.0) ; 1.6180337185494662
