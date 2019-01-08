#lang racket

(require rackunit)
(require "lib/diff.rkt")

(define (base e) (cadr e))
(define (exponent e) (caddr e))

(define (exponentiation? x)
  (and (pair? x) (eq? (car x) '**)) (number? (exponent x)))

(define (make-exponentiation b e)
  (cond
    ((=number? e 0) 1)
    ((=number? e 1) b)
    (else (list '** b e))))

(define (deriv exp var)
  (cond
    ((number? exp) 0)
    ((variable? exp) (if (same-variable? exp var) 1 0))
    ((sum? exp) (make-sum (deriv (addend exp) var)
                          (deriv (augend exp) var)))
    ((product? exp)
     (make-sum
       (make-product (multiplier exp) (deriv (multiplicand exp) var))
       (make-product (multiplicand exp) (deriv (multiplier exp) var))))
    ((exponentiation? exp)
     (make-product (exponent exp)
                   (make-product (make-exponentiation
                                   (base exp)
                                   (- (exponent exp) 1))
                                 (deriv (base exp) var))))
    (else (error "unknow expression type: DERIV" exp))))

(check-match (deriv (list '** 'x 2) 'x)
             (list '* 2 'x))
