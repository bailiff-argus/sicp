(load "./1.3.1-procedures-as-arguments.scm")

;; 1.29 Simpson integral

(define (simpson-integral f a b n)
  (define h (/ (- b a) n))
  (define (add-2h x) (+ x (* 2 h)))
  (* (/ h 3)
     (+ (f a)
        (* 4 (sum f    (+ a h) add-2h       b))
        (* 2 (sum f (add-2h a) add-2h (- b h)))
        (f b))))

(simpson-integral cube 0 1 100)  ; 1/4
(simpson-integral cube 0 1 1000) ; 1/4
