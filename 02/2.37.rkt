#lang racket/base

(require rackunit)

(define (dot-product v w)
  (foldr + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (w) (dot-product v w)) m))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      null
      (cons (foldr op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

(define (transpose mat)
  (accumulate-n cons null mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (w) (matrix-*-vector cols w)) m)))

(define v (list 1 2))
(define m (list (list 0 1) (list 1 0)))
(define n (list (list 1 2) (list 3 4)))

(check-eq? (dot-product v v) 5)
(check-match (matrix-*-vector m v) (list 2 1))
(check-match (transpose n)
             (list (list 1 3) (list 2 4)))
(check-match (matrix-*-matrix m n)
             (list (list 3 4) (list 1 2)))
