#lang racket/base

(require racket/mpair)
(require rackunit)

(define (lookup key table)
  (let ((record (assoc key (mcdr table))))
    (if record
        (mcdr record)
        #f)))

(define (assoc key records)
  (cond ((null? records) #f)
        ((equal? key (mcar (mcar records))) (mcar records))
        (else (assoc key (mcdr records)))))

(define (insert! key value table)
  (let ((record (assoc key (mcdr table))))
    (if record
        (set-mcdr! record value)
        (set-mcdr! table
                  (mcons (mcons key value)
                         (mcdr table)))))
  'ok)

(define (make-table)
  (mlist '*table*))

(provide (all-defined-out))
