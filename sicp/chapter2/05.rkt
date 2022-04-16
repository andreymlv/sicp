; Exercise 2.5
#lang sicp

(#%require rackunit)

;; Number Number -> Number
;; prod. 2^a * 2^b
(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(check-equal? (cons 4 5) (* (* 2 2 2 2) (* 3 3 3 3 3)))

;; Number Number -> Boolean
;; prod. true if a can be divided by b
(define (can-divide? a b)
  (= (remainder a b) 0))

(check-true (can-divide? 2 2))
(check-false (can-divide? 2 3))

;; Number Number -> Number
;; prod. number without b as multiplier
(define (remove-multiplier a b)
  (if (can-divide? a b)
      (remove-multiplier (/ a b) b)
      a))

(check-equal? (remove-multiplier 3888 3) 16)

;; Number Number -> Number
;; prod. log with base
(define (log-with-base base a)
  (/ (log a) (log base)))

(check-equal? (log-with-base 2 1024) 10.0)

;; Number -> Number
;; prod. count how many times input number can be divided by 2
(define (car z)
  (round (log-with-base 2 (remove-multiplier z 3))))

(check-equal? (car (cons 4 5)) 4.0)

;; Number -> Number
;; prod. count how many times input number can be divided by 3
(define (cdr z)
  (round (log-with-base 3 (remove-multiplier z 2))))

(check-equal? (cdr (cons 4 5)) 5.0)

(check-equal? (let ([z (cons 4 5)])
                (cons (car z) (cdr z)))
              3888.0)