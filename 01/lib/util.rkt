#lang racket/base

(define (double x) (* x 2))
(define (halve x) (/ x 2))

(define (cube x) (* x x x))

(provide (all-defined-out))
