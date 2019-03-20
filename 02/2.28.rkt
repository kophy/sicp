#lang racket

(require rackunit)

(define (fringe tree)
  (cond
    ((null? tree) null)
    ((cons? (car tree))
      (append (fringe (car tree))
              (fringe (cdr tree))))
    (else
      (cons (car tree) (fringe (cdr tree))))))

(define x (list (list 1 2) (list 3 4)))
(check-match (fringe x) (list 1 2 3 4))
