#lang racket/base

(require rackunit)

(define (make-eq-set)
  (let ((l null))
    (define (contains? x)
      (define (seen-helper x n)
        (cond
          ((null? n) #f)
          ((pair? n) (or (eq? (car n) x) (seen-helper (cdr n) x)))
          (else (eq? n x))))
      (seen-helper x l))
    (define (add x)
      (set! l (cons x l)))
    (define (dispath m)
      (cond
        ((eq? m 'contains?) contains?)
        ((eq? m 'add) add)
        (else 1)))
    dispath))

(define (count-pairs x)
  (define (count-pairs-helper x seen)
    (cond
      ((not (pair? x)) 0)
      (((seen 'contains?) x) 0)
      (else
        (begin
          ((seen 'add) x)
          (+ (count-pairs-helper (car x) seen)
             (count-pairs-helper (cdr x) seen)
             1)))))
  (let ((seen (make-eq-set)))
    (count-pairs-helper x seen)))

(define seen (make-eq-set))
(define x (cons 1 2))
(define y (cons 1 2))

((seen 'add) x)
(check-true ((seen 'contains?) x))
(check-false ((seen 'contains?) y))

(check-eq? (count-pairs x) 1)
(check-eq? (count-pairs (cons x x)) 2)
