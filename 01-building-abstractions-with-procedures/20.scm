(define (euclid-gcd a b)
  (if (= b 0)  
      a
      (euclid-gcd b (remainder a b))))

;; Reminder for evaluation order:
;; - applicative: evaluate operands and operator, apply procedure
;; - normal: expand fully, reduce result by applying procedures

(define (euclid-gcd a b)
  (if (= b 0)  
      a
      (euclid-gcd b (remainder a b))))


(gcd 206 40) ;; 40 is obviously not 0, so let's skip step 0

;; step 1

(gcd 40 (remainder 206 40))

(if (= (remainder 206 40) 0)     ;; remainder calculations: 1
    40
    (gcd (remainder 206 40)
         (remainder 40 (remainder 206 40))))

(if (= 6 0)
    40
    (gcd (remainder 206 40)
         (remainder 40 (remainder 206 40))))


;; step 2

(gcd (remainder 206 40)
     (remainder 40 (remainder 206 40)))

(if (= (remainder 40 (remainder 206 40)) 0)  ;; remainder calculations: 2
    (remainder 206 40)
    (gcd (remainder 40 (remainder 206 40))
         (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))

(if (= 4 0)
    (remainder 206 40)
    (gcd (remainder 40 (remainder 206 40))                                  ;; this is 4 btw
         (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))) ;; and this is (remainder 6 4), which is 2, so we're not done yet! yahoo!


;; step 3
(gcd (remainder 40 (remainder 206 40))
     (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))

;; b is
;;   (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) == 2
;; (remainder a b) is 
;;   (remainder (remainder 40 (remainder 206 40))
;;              (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))

(if (= 0 (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) ;; remainder calculations: 4
    (remainder 40 (remainder 206 40))
    (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
         (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))

(if (= 0 2) ;; remainder calculations: 7
    (remainder 40 (remainder 206 40))
    (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
         (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))


;; step 4
(gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
     (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))

;; b is (remainder 4 (remainder 6 4)) = 0 (finally)
;;   (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
;; (remainder a b) is
;;   (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;;              (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))

(if (= 0
       (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))) ;; remainder calculations: 7
       (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
       (gcd (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
            (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
                       (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
         ))

(if (= 0 0) ;; thankfully
       (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) ;; remainder calculations: 4
       (gcd (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
            (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
                       (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
         ))

;; Total for normal order: 1 + 2 + 4 + 7 + 4 = 18 remainder calculations

;; For the applicative order:

;; Step 0
(gcd 206 40)

(if (= 40 0)
    206
    (gcd 40 (remainder 206 40))) ; 1 calculation

;; Step 1
(gcd 40 6)

(if (= 6 0)
    40
    (gcd 6 (remainder 40 6))) ; 1 calculation

;; Step 2
(gcd 6 4)

(if (= 4 0) 6 (gcd 4 (remainder 6 4))) ;; 1 calculation

;; Step 3
(gcd 4 2)

(if (= 2 0) 4 (gcd 2 (remainder 4 2))) ;; 1 calculation

;; Step 4
(gcd 2 0)
(if (= 0 0) 2 (gcd 0 (remainder 2 0))) ;; 0 calucations

;; Totals:
;; - applicative: 4
;; - normal: 18
