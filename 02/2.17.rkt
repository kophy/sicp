#lang racket/base

(require rackunit)

(define (last-pair l)
  (if (null? (cdr l))
      (car l)
      (last-pair (cdr l))))

(check-eq? (last-pair (list 23 72 149 34)) 34)
