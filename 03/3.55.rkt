#lang racket/base

(require rackunit)
(require racket/stream)

(define (integers-start-from-i i)
  (stream-cons i (integers-start-from-i (+ i 1))))
(define integers (integers-start-from-i 1))

(define (add-streams s1 s2)
  (stream-cons (+ (stream-first s1) (stream-first s2))
               (add-streams (stream-rest s1) (stream-rest s2))))

(define (partial-sum s)
  (stream-cons (stream-first s)
               (add-streams (stream-rest s) (partial-sum s))))

(define ps (partial-sum integers))
(check-eq? (stream-ref ps 0) 1)
(check-eq? (stream-ref ps 2) 6)
