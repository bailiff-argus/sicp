(define (cube x) (* x x x))

(define (sum-integers-manual a b)
  (if (> a b)
      0
      (+ a (sum-integers (+ a 1) b))))

(define (sum-cubes-manual a b)
  (if (> a b)
     0
     (+ (cube a)
        (sum-cubes (+ a 1) b))))

(define (pi-sum-manual a b)
  (if (> a b)
      0
      (+ (/ 1.0 (* a (+ a 2)))
         (pi-sum (+ a 4) b))))


(define (sum term a next b)
  (if (> a b)
     0
     (+ (term a)
        (sum term (next a) next b))))

(define (inc x) (+ x 1))
(define (dec x) (- x 1))

(define (sum-cubes a b)
  (sum cube a inc b))

(sum-cubes 1 10)


(define (identity x) x)

(define (sum-integers a b)
  (sum identity a inc b))

(sum-integers 1 10)

(define (pi-sum a b)
  (define (term a) (/ 1.0 (* a (+ a 2))))
  (define (next a) (+ a 4))
  (sum term a next b))

(pi-sum 1 10)

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(integral cube 0 1 0.00001) ; .24999999998662864
