; Exercise 2.6
; https://en.wikipedia.org/wiki/Church_encoding#Church_numerals
#lang sicp

(#%require rackunit)

(define (inc n)
  (+ n 1))

(define zero
  (lambda (_)
    (lambda (x) x)))

(check-equal? ((zero inc) 0) 0)
(check-equal? ((zero inc) 1) 1)

(define (add-1 n)
  (lambda (f)
    (lambda (x)
      (f ((n f) x)))))

(check-equal? (((add-1 zero) inc) 1) 2)

; 1. λf.λx.f(((λf.λx.x) f) x)
; 2. λf.λx.f(λx.x)x
; 3. λf.λx.fx
(define one
  (lambda (f)
    (lambda (x)
      (f x))))

(check-equal? ((one inc) 1) 2)

; 1. λf.λx.f(((λf.λx.fx) f) x)
; 2. λf.λx.f((λx.fx) x)
; 3. λf.λx.f(fx)
(define two
  (lambda (f)
    (lambda (x)
      (f (f x)))))

(define (add a b)
  (lambda (f)
    (lambda (x)
      ((a f) ((b f) x)))))

(check-equal? (((add one two) inc) 2) 5)

(define (add-via-1 a b)
  ((a add-1) b))

(check-equal? (((add-via-1 one two) inc) 2) 5)