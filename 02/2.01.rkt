#lang racket/base

(require rackunit)

(define (gcd a b)
  (cond
    ((= (modulo a b) 0) b)
    ((= (modulo b a) 0) a)
    ((< a b) (gcd a (modulo b a)))
    (else (gcd b (modulo a b)))))

(define (sign n)
  (if (>= n 0) 1 -1))

(define (make-rat n d)
  (let ((g (gcd (abs n) (abs d))))
    (cond
      ((= (sign n) (sign d)) (cons (/ (abs n) g) (/ (abs d) g)))
      (else (cons (/ (- (abs n)) g) (/ (abs d) g))))))

(check-match (make-rat 2 4) (cons 1 2))
(check-match (make-rat -2 4) (cons -1 2))
(check-match (make-rat 2 -4) (cons -1 2))
