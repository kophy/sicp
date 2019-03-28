#lang racket

(require rackunit)

(define (element-of-set? x set)
  (cond
    ((null? set) false)
    ((= x (car set)) true)
    ((< x (car set)) false)
    (else (element-of-set? x (cdr set)))))

(define s (list 1 3 4))
(check-true (element-of-set? 3 s))
(check-false (element-of-set? 0 s))
(check-false (element-of-set? 5 s))

(define (adjoin-set x set)
  (cond
    ((null? set) (list x))
    ((< x (car set)) (cons x set))
    ((= x (car set)) set)
    (else (cons (car set) (adjoin-set x (cdr set))))))

(check-match (adjoin-set 1 s) (list 1 3 4))
(check-match (adjoin-set 2 s) (list 1 2 3 4))
