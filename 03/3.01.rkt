#lang racket/base

(require rackunit)

(define (make-accumulator v)
  (lambda (x)
    (begin (set! v (+ v x))
           v)))

(define A (make-accumulator 5))
(check-eq? (A 10) 15)
(check-eq? (A 10) 25)
