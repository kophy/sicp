#lang racket/base

(require rackunit)

;; point
(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

;; segment
(define (make-segment p1 p2) (cons p1 p2))
(define (start-segment s) (car s))
(define (end-segment s) (cdr s))
(define (mid-segment s)
  (define p1 (start-segment s))
  (define p2 (end-segment s))
  (make-point (/ (+ (x-point p1) (x-point p2)) 2.0)
              (/ (+ (y-point p1) (y-point p2)) 2.0)))

(define p1 (make-point 0 0))
(define p2 (make-point 2 2))
(define mid-p (mid-segment (make-segment p1 p2)))
(check-= (x-point mid-p) 1 0.001)
(check-= (y-point mid-p) 1 0.001)
