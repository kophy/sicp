#lang racket/base

(require rackunit)

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))

(define z (cons 1 2))
(check-eq? (car z) 1)
(check-eq? (cdr z) 2)
