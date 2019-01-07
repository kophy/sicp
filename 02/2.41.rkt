#lang racket

(require rackunit)

(define (flatmap f l)
  (foldr append null (map f l)))

(define (three-sum n s)
  (filter
    (lambda (l) (= (foldr + 0 l) s))
    (flatmap
      (lambda (p)
           (map (lambda (z) (append p (list z))) (range 1 n)))
      (flatmap
        (lambda (x)
              (map (lambda (y) (list x y)) (range 1 n)))
        (range 1 n)))))

(check-match (three-sum 3 0) null)
(check-match (three-sum 3 3) (list (list 1 1 1)))
