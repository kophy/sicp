#lang racket

(require rackunit)

(define (tree-map f tree)
  (cond
    ((null? tree) null)
    ((cons? (car tree))
     (cons (tree-map f (car tree)) (tree-map f (cdr tree))))
    (else (cons (f (car tree)) (tree-map f (cdr tree))))))

(define tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))
(check-match (tree-map (lambda (x) (* x x)) tree)
             (list 1 (list 4 (list 9 16) 25) (list 36 49)))
