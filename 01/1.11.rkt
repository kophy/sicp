#lang racket/base

(require rackunit)

;; recursive method
(define (f n) 
  (cond
    ((< n 3) n)
    (else (+ (f (- n 1))
             (* (f (- n 2)) 2)
             (* (f (- n 3)) 3)))))

(check-eq? (f 1) 1)
(check-eq? (f 3) 4)
(check-eq? (f 4) 11)

;; iterative method
(define (f-iter-helper n count f1 f2 f3)
  (cond
    ((< n 3) n)
    ((= n count) f1)
    (else (f-iter-helper n (+ count 1) (+ f1 (* f2 2) (* f3 3)) f1 f2))))

(define (f-iter n) (f-iter-helper n 2 2 1 0))

(check-eq? (f-iter 1) 1)
(check-eq? (f-iter 3) 4)
(check-eq? (f-iter 4) 11)
