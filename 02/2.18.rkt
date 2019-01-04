#lang racket/base

(require rackunit)

(define (reverse l)
  (if (null? (cdr l))
      l
      (append (reverse (cdr l)) (list (car l)))))

(check-match (reverse (list 1)) (list 1))
(check-match (reverse (list 1 2)) (list 2 1))
