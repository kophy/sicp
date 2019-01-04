#lang racket

(require rackunit)

(define (same-parity a . w)
  (define (same-parity-helper l)
   (cond
     ((empty? l) null)
     ((= (modulo a 2) (modulo (car l) 2))
        (cons (car l) (same-parity-helper (rest l))))
     (else (same-parity-helper (rest l)))))
  (cons a (same-parity-helper w)))

(check-match (same-parity 1) (list 1))
(check-match (same-parity 1 2 3) (list 1 3))
