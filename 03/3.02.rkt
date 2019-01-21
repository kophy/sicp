#lang racket/base

(require rackunit)

(define (make-monitored f)
  (let ((count 0))
    (lambda (x)
      (cond
        ((eq? x 'how-many-calls?) count)
        (else (begin
                (set! count (+ count 1))
                (f x)))))))

(define s (make-monitored sqrt))
(check-eq? (s 'how-many-calls?) 0)
(check-eq? (s 100) 10)
(check-eq? (s 'how-many-calls?) 1)
