#lang racket/base

(require rackunit)
(require "lib/util.rkt")

(define (double f)
  (lambda (x) (f (f x))))

(check-eq? (((double (double double)) inc) 5) 21)
