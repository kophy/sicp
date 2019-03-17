#lang racket/base

(require rackunit)

(define (square-sum x y)
  (+ (* x x) (* y y)))

(define (square-sum-of-two-larger x y z)
  (cond
    ((and (< x y) (< x z)) (square-sum y z))
    ((and (< y x) (< y z)) (square-sum x z))
    (else (square-sum x y))))

(check-eq? (square-sum-of-two-larger 1 2 3) 13)
(check-eq? (square-sum-of-two-larger 3 2 1) 13)
