#lang racket/base

(require rackunit)

(define (map p sequence)
  (foldr (lambda (x l) (cons (p x) l)) null sequence))

(check-match (map (lambda (x) (* 2 x)) (list 1 2 3))
             (list 2 4 6))

(define (append seq1 seq2)
  (foldr cons seq2 seq1))

(check-match (append (list 1 2) (list 3 4))
             (list 1 2 3 4))

(define (length sequence)
  (foldr (lambda (x length) (+ length 1)) 0 sequence))

(check-eq? (length (list 1 2)) 2)
