#lang racket/base

(require rackunit)
(require "lib/util.rkt")

;; compose from 1.42
(define (compose f g)
  (lambda (x) (f (g x))))

(check-eq? ((compose inc inc) 1) 3)

;; repeated from 1.43
(define (repeated f n)
  (define (repeated-helper i result)
    (if (= i n)
        result
        (repeated-helper (+ i 1) (f result))))
  (lambda (x) (repeated-helper 0 x)))

(check-eq? ((repeated inc 2) 1) 3)

(define (smooth f)
  (define dx 0.0001)
  (lambda (x) (/ (+ (f (- x dx) (f x) (f (+ x dx))))
                 3)))

(define (n-fold-smooth f n)
  ((repeated smooth n) f))
