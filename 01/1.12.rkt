#lang racket/base

(require rackunit)

(define (pascal r c)
  (cond
    ((or (= c 0) (= c r)) 1)
    (else (+ (pascal (- r 1) c) (pascal (- r 1) (- c 1))))))

(check-eq? (pascal 0 0) 1)
(check-eq? (pascal 3 1) 3)
