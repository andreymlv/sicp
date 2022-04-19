; Exercise 2.7
#lang sicp

(#%require rackunit)

(define (make-interval a b) (cons a b))

(define (lower-bound i) (car i))

(define (upper-bound i) (cdr i))

(check-eq? (lower-bound (make-interval 1 2)) 1)
(check-eq? (upper-bound (make-interval 1 2)) 2)