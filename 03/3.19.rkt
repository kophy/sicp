#lang racket/base

(require racket/mpair)
(require rackunit)

(define (safe-cdr p)
  (cond
    (mpair? p) (mcdr p)
    (else null)))

(define (has-cycle? l)
  (define (has-cycle-helper slow fast)
   (cond
     ((or (not (mpair? slow)) (not (mpair? fast))) #f)
     ((eq? slow fast) #t)
     (else (has-cycle-helper (mcdr slow) (safe-cdr (mcdr fast))))))
  (let ((slow (mcdr l))
        (fast (safe-cdr (safe-cdr l))))
    (has-cycle-helper slow fast)))

(define l (mcons 1 (mcons 2 3)))
(check-false (has-cycle? l))
(set-mcdr! l l)
(check-true (has-cycle? l))
