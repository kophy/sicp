#lang racket

(require rackunit)

(define (square x) (* x x))

(define (square-list-1 items)
  (if (null? items)
      null
      (cons (square (car items)) (square-list-1 (rest items)))))

(define (square-list-2 items)
  (map (lambda (x) (square x)) items))

(check-match (square-list-1 (list 1 2 3)) (list 1 4 9))
(check-match (square-list-2 (list 1 2 3)) (list 1 4 9))
