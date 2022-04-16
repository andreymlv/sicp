; https://en.wikipedia.org/wiki/Cons#Functional_implementation
#lang sicp

(#%require rackunit)

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p _) p)))

(define (cdr z)
  (z (lambda (_ q) q)))

(check-eq? (car (cons 1 2)) 1)
(check-eq? (cdr (cons 1 2)) 2)