#lang racket/base

(require rackunit)

(define (fast-expt-iter-helper b n a)
  (cond
    ((= n 0) a)
    ((even? n) (fast-expt-iter-helper (* b b) (/ n 2) a))
    (else (fast-expt-iter-helper b (- n 1) (* a b)))))

(define (fast-expt-iter b n) (fast-expt-iter-helper b n 1))

(check-eq? (fast-expt-iter 2 0) 1)
(check-eq? (fast-expt-iter 2 3) 8)
(check-eq? (fast-expt-iter 2 5) 32)
