#lang racket/base

(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y))

(test 0 (p))
; applicative-order evaluation -> infinite loop
; normal-order evaluation -> 0
