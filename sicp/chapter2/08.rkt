; Exercise 2.8
#lang sicp

(#%require rackunit)

(define (make-interval a b) (cons a b))

(define (lower-bound i) (car i))

(define (upper-bound i) (cdr i))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

(check-within (let ([i1 (make-interval 2.58 2.97)] [i2 (make-interval 3.58 4.1)])
                (sub-interval i1 i2))
              (make-interval -1.52 -0.61)
              0.001)