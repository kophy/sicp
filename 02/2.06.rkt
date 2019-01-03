#lang racket/base

(require rackunit)

(define zero
  (lambda (f)
    (lambda (x) x)))

(define (add-1 n)
  (lambda (f)
    (lambda (x)
      (f ((n f) x)))))

(define one
  (lambda (f)
    (lambda (x)
      (f x))))

(define two
  (lambda (f)
    (lambda (x)
      (f (f x)))))

(define succ (lambda (x) (+ x 1)))
(check-eq? ((zero succ) 0) 0)
(check-eq? ((one succ) 0) 1)
(check-eq? ((two succ) 0) 2)
