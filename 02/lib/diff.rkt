#lang racket

(define (addend s) (cadr s))
(define (augend s) (caddr s))

(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))

(define (multiplier p) (cadr p))
(define (multiplicand p) (caddr p))

(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and
      (variable? v1)
      (variable? v2)
      (eq? v1 v2)))

(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (make-sum a1 a2)
  (cond
    ((=number? a1 0) a2)
    ((=number? a2 0) a1)
    ((and (number? a2) (number? a2))
      (+ a1 a2))
    (else (list '+ a1 a2))))

(define (make-product m1 m2)
  (cond
    ((or (=number? m1 0) (=number? m2 0)) 0)
    ((=number? m1 1) m2)
    ((=number? m2 1) m1)
    ((and (number? m1) (number? m2)) (* m1 m2))
    (else (list '* m1 m2))))

(provide (all-defined-out))
