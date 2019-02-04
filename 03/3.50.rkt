#lang racket/base

(require rackunit)
(require "lib/stream.rkt")

(define (stream-map proc . argstreams)
  (if (stream-null? (car argstreams))
      the-empty-stream
      (stream-cons
        (apply proc (map stream-car argstreams))
        (apply stream-map (cons proc (map stream-cdr argstreams))))))

(define s1 (stream-enumerate-interval 0 2))
(define s2 (stream-enumerate-interval 3 5))
(define s (stream-map + s1 s2))
(check-match (stream-to-list s) (list 3 5 7))
