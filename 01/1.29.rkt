#lang racket/base

(require rackunit)
(require "lib/util.rkt")

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a) (sum term (next a) next b))))

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (y k) (f (+ a (* k h))))
  (define (coeff k)
    (cond
      ((or (= k 0) (= k n)) 1)
      ((even? k) 2)
      (else 4)))
  (define (term k) (* (coeff k) (y k)))
  (/ (* h (sum term 0 inc n))
     3.0)
  )

(define (one x) 1)

(check-= (simpson one 0 1 10) 1 0.001)
(check-= (simpson identity 0 1 10) 0.5 0.001)
