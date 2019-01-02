#lang racket/base

(define (double x) (* x 2))
(define (halve x) (/ x 2))

(define (identity x) x)
(define (square x) (* x x))
(define (cube x) (* x x x))

(define (inc x) (+ x 1))

(provide (all-defined-out))
