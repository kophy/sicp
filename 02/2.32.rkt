#lang racket

(require rackunit)

(define (subset s)
  (if (null? s)
      (list null)
      (let ((rest (subset (cdr s))))
        (append rest (map (lambda (x) (cons (car s) x)) rest)))))

(check-match (subset null) (list null))
(check-match (subset (list 1 2)) 
             (list null (list 2) (list 1) (list 1 2)))
