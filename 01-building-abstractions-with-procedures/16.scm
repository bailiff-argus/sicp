(define (square x)
  (* x x))

(define (even? num)
  (= (remainder num 2) 0))

(define (fast-expt-rec b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt-rec b (/ n 2))))
        (else (* b (fast-expt-rec b (- n 1))))))

(define (fast-expt-iter b n prod)
  (cond ((= n 0) prod)
        ((even? n) (fast-expt-iter (square b) (/ n 2) prod))
        (else (fast-expt-iter b (- n 1) (* b prod)))))

(define (fast-expt-i b n)
  (fast-expt-iter b n 1))

(define (assert_same f1 f2 arg1 arg2)
  (= (f1 arg1 arg2) (f2 arg1 arg2)))

(and
    (assert_same fast-expt-rec fast-expt-i  2  2)
    (assert_same fast-expt-rec fast-expt-i  3  3)
    (assert_same fast-expt-rec fast-expt-i  4  4)
    (assert_same fast-expt-rec fast-expt-i  5  5)
    (assert_same fast-expt-rec fast-expt-i  6  6)
    (assert_same fast-expt-rec fast-expt-i  7  7)
    (assert_same fast-expt-rec fast-expt-i  8  8)
    (assert_same fast-expt-rec fast-expt-i  9  9)
    (assert_same fast-expt-rec fast-expt-i 10 10))
