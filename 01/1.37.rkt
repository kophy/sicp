#lang racket/base

(require rackunit)
(require "lib/util.rkt")

;; recursive
(define (cont-frac n d k)
  (define (cont-frac-helper i)
    (if (> i k)
        0
        (/ (d i) (+ (n i) (cont-frac-helper (+ i 1))))))
  (cont-frac-helper 1))

(check-= (cont-frac (lambda (i) 1.0)
                    (lambda (i) 1.0)
                    100) 0.6180 0.0001)

;; iterative
(define (cont-frac-iter n d k)
  (define (cont-frac-iter-helper i result)
    (if (= i 0)
        result
        (cont-frac-iter-helper (- i 1) (/ (d i) (+ (n i) result)))))
  (cont-frac-iter-helper k 1))

(check-= (cont-frac-iter (lambda (i) 1.0)
                         (lambda (i) 1.0)
                         100) 0.6180 0.0001)
