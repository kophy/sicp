#lang racket/base

(require rackunit)

(define (reverse-with-foldr sequence)
  (foldr (lambda (x v) (append v (list x))) null sequence))

(define (reverse-with-foldl sequence)
  (foldl cons null sequence))

(check-match (reverse-with-foldr (list 1 2 3))
             (list 3 2 1))
(check-match (reverse-with-foldl (list 1 2 3))
             (list 3 2 1))
