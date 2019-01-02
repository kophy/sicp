#lang racket/base

(require rackunit)
(require "lib/util.rkt")

;; recursive
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate combiner null-value term (next a) next b))))

(check-eq? (accumulate + 0 identity 0 inc 2) 3)
(check-eq? (accumulate * 1 identity 1 inc 3) 6)

;; iterative
(define (accumulate-iter combiner null-value term a next b)
  (if (> a b)
      null-value
      (accumulate-iter combiner (combiner (term a) null-value) term (next a) next b)))

(check-eq? (accumulate-iter + 0 identity 0 inc 2) 3)
(check-eq? (accumulate-iter * 1 identity 1 inc 3) 6)
