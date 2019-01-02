#lang racket/base

(require rackunit)
(require "lib/util.rkt")

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))

(check-eq? (sum identity 0 inc 2) 3) ;; f(x) = x
(check-eq? (sum square 0 inc 2) 5)   ;; f(x) = x^2
