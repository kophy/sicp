#lang racket/base

(require rackunit)
(require racket/stream)

(define (integers-start-from-i i)
  (stream-cons i (integers-start-from-i (+ i 1))))
(define integers (integers-start-from-i 1))

(define (mul-streams s1 s2)
  (stream-cons (* (stream-first s1) (stream-first s2))
               (mul-streams (stream-rest s1) (stream-rest s2))))

(define factorials
  (stream-cons 1 (mul-streams factorials integers)))

(check-eq? (stream-ref factorials 1) 1)
(check-eq? (stream-ref factorials 3) 6)
