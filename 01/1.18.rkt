#lang racket/base

(require rackunit)
(require "lib/util.rkt")

(define (fast-mult-iter-helper a b product)
  (cond
    ((= b 0) product)
    ((even? b) (fast-mult-iter-helper (double a) (halve b) product))
    (else (fast-mult-iter-helper a (- b 1) (+ product a)))))

(define (fast-mult-iter a b) (fast-mult-iter-helper a b 0))

(check-eq? (fast-mult-iter 2 3) 6)
(check-eq? (fast-mult-iter 3 2) 6)
