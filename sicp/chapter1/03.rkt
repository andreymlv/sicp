; Exercise 1.3
#lang sicp

(#%require rackunit)

;; Number Number Number -> Number
;; prod. sum of squares of max between a, b and max between c, min between a b
(define (sum-of-squares-two-largest a b c)
  (+ (expt (max a b) 2)
     (expt (max c (min a b)) 2)))

(check-equal? (sum-of-squares-two-largest 1 2 3) (+ 9 4))
(check-equal? (sum-of-squares-two-largest 1 2 1) (+ 4 1))
