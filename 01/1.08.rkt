#lang racket/base

(require rackunit)
(require "lib/util.rkt")

(define (good-enough? guess x)
  (< (abs (- (cube guess) x)) 0.001))

(define (improve guess x)
  (/ (+
       (/ x (* guess guess))
       (* guess 2))
     3))

(define (cube-root-iter guess x)
  (cond
    ((good-enough? guess x) guess)
    (else (cube-root-iter (improve guess x) x))))

(define (cube-root x) (cube-root-iter 1.0 x))

(check-true (good-enough? 2 8))
(check-false (good-enough? 3 8))
(check-= (cube-root 8) 2 0.01)
