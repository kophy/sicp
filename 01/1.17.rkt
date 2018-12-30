#lang racket/base

(require rackunit)
(require "lib/util.rkt")

(define (fast-mult a b)
  (cond
    ((= b 0) 0)
    ((even? b) (fast-mult (double a) (halve b)))
    (else (+ a (fast-mult a (- b 1))))))

(check-eq? (fast-mult 2 3) 6)
(check-eq? (fast-mult 3 2) 6)
