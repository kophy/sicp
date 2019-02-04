#lang racket/base

(require racket/promise)
(require rackunit)

(define the-empty-stream '())
(define (stream-null? stream) (eq? stream the-empty-stream))
(define (stream-cons a b) (cons a (delay b)))

(define (stream-car stream) (car stream))
(define (stream-cdr stream) (force (cdr stream)))

(define (stream-enumerate-interval low high)
  (if (> low high)
      the-empty-stream
      (stream-cons low (stream-enumerate-interval (+ low 1) high))))

(define (stream-to-list stream)
  (if (stream-null? stream)
      (list)
      (cons (stream-car stream) (stream-to-list (stream-cdr stream)))))

(provide (all-defined-out))
