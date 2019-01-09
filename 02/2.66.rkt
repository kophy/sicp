#lang racket

(require rackunit)
(require "lib/tree.rkt")

(define (lookup given-key tree)
  (cond
    ((null? tree) false)
    ((= (entry tree) given-key) true)
    ((< (entry tree) given-key) (lookup given-key (right-branch tree)))
    (else (lookup given-key (left-branch tree)))))

(define tree (make-tree 2 (make-tree 1 null null)
                          (make-tree 3 null null)))

(check-true (lookup 1 tree))
(check-false (lookup 4 tree))
